#!/usr/bin/env python3
"""
Gentoo Faster v1.0: An Automated, Universal Gentoo Installer
Branch-aware, full-control: Hyprland, KDE; Metal or any VM.
All system logic, packages, and customizations are user-curated.
WARNING: Destroys all data on selected disk. For personal/highly customized installations only.
"""

import os
import sys
import subprocess
import time
import getpass
import re
import shutil
import secrets
import string

### ===== ALL PACKAGE SETS: ORGANIZED =====
PKG = {
    # Core system
    "base": [
        "app-admin/sudo", "app-editors/vim", "net-wireless/iwd", "net-misc/openssh", "sys-process/cronie",
        "app-admin/syslog-ng", "sys-fs/udisks", "sys-fs/udiskie", "sys-fs/exfatprogs", "sys-fs/ntfs3g"
    ],
    # CLI/modern shell
    "cli": [
        "app-shells/starship", "app-shells/zoxide", "sys-apps/eza"
    ],
    # Dev and essentials
    "dev": [
        "dev-vcs/git", "dev-util/github-cli", "sys-devel/gdb"
    ],
    # Common GUI fonts and theming
    "fonts": [
        "media-fonts/noto", "media-fonts/noto-cjk", "media-fonts/noto-emoji", "media-fonts/nerd-fonts", "x11-themes/papirus-icon-theme"
    ],
    # Pipewire audio stack (always, both DEs)
    "audio": [
        "media-video/pipewire", "media-sound/wireplumber", "media-sound/pavucontrol", "media-sound/easyeffects"
    ],
    # Hyprland main set
    "wayland": [
        "gui-wm/hyprland", "gui-apps/waybar", "gui-apps/rofi-wayland",
        "gui-apps/swaylock", "gui-apps/swayidle", "gui-apps/swaybg", "gui-apps/wl-clipboard",
        "gui-apps/grim", "gui-apps/slurp", "gui-apps/mako", "gui-apps/foot", "gui-apps/swappy", "x11-misc/dunst"
    ],
    # KDE main set (+ sddm, X11 forced later)
    "kde": [
        "kde-plasma/plasma-meta", "x11-misc/sddm",
        "kde-apps/dolphin", "kde-apps/konsole", "app-editors/kate",
        "kde-apps/gwenview", "kde-apps/okular", "kde-apps/ark"
    ],
    # Common GUI, must-have
    "gui_common": [
        "www-client/chromium-bin", "media-video/vlc", "media-sound/easytag", "net-p2p/transmission",
        "media-gfx/gimp", "media-gfx/inkscape", "media-gfx/nomacs", "net-firewall/ufw",
        "app-office/libreoffice-bin", "app-misc/fastfetch", "net-misc/yt-dlp",
        "media-video/handbrake", "sys-apps/nvtop", "x11-terms/kitty"
    ],
    # File manager & extra
    "fileman": [
        "kde-apps/dolphin", "media-gfx/imv"
    ],
    # VM additions (per-branch)
    "vbox": ["app-emulation/virtualbox-guest-additions"],
    "vmware": ["app-emulation/open-vm-tools"],
    # Metal drivers
    "nvidia": ["x11-drivers/nvidia-drivers"],
    "amdgpu": ["x11-drivers/xf86-video-amdgpu", "media-libs/mesa"],
    "intel": ["x11-drivers/xf86-video-intel", "media-libs/mesa"],
    "intel_ucode": ["sys-firmware/intel-microcode"],
    "amd_ucode": ["sys-firmware/amd-ucode"],
    # Overlays/extra/fun
    "guru": ["app-eselect/eselect-repository"],
    "devilspie2": ["x11-misc/devilspie2"],
}

def build_pkgs(de, env, video, micro, overlay_guru=False):
    pkgs = []
    pkgs += PKG['base'] + PKG['cli'] + PKG['dev'] + PKG['fonts'] + PKG['audio']
    pkgs += PKG['gui_common'] + PKG['fileman']
    if de == "hyprland":
        pkgs += PKG['wayland']
    elif de == "kde":
        pkgs += PKG['kde']
    if env == "virtualbox":
        pkgs += PKG['vbox']
    elif env == "vmware":
        pkgs += PKG['vmware']
    if env == "metal":
        if video == "nvidia":
            pkgs += PKG['nvidia']
        elif video == "amdgpu":
            pkgs += PKG['amdgpu']
        elif "intel" in video:
            pkgs += PKG['intel']
        if micro == "intel":
            pkgs += PKG['intel_ucode']
        elif micro == "amd":
            pkgs += PKG['amd_ucode']
    if overlay_guru:
        pkgs += PKG['guru'] + PKG['devilspie2']
    return list(dict.fromkeys(pkgs))  # Dedup, preserve order

class Colors:
    OKGREEN = "\033[92m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    WARNING = "\033[93m"
    BOLD = "\033[1m"
    HEADER = "\033[95m"

class Logger:
    @staticmethod
    def info(msg): print(f"{Colors.BOLD}[INFO]{Colors.ENDC} {msg}")
    @staticmethod
    def success(msg): print(f"{Colors.OKGREEN}[OK]{Colors.ENDC} {msg}")
    @staticmethod
    def error(msg): print(f"{Colors.FAIL}[FAIL]{Colors.ENDC} {msg}")
    @staticmethod
    def warning(msg): print(f"{Colors.WARNING}[WARN]{Colors.ENDC} {msg}")
    @staticmethod
    def header(msg):
        print(f"\n{Colors.HEADER}{Colors.BOLD}{'='*58}")
        print(msg)
        print('='*58 + Colors.ENDC + "\n")

class GentooInstaller:
    def __init__(self):
        self.disk = None
        self.disk_label = None
        self.mount_point = "/mnt/gentoo"
        self.envtype = None
        self.video_cards = None
        self.cpu_vendor = None
        self.desktop_env = None
        self.use_custom = False
        self.username = None
        self.user_password = None
        self.root_password = None
        self.hostname = None
        self.timezone = None
        self.overlay_guru = False

    def pick_disk(self):
        Logger.header("Pick Target Disk")
        os.system("lsblk -d -o NAME,SIZE,MODEL,TYPE")
        while True:
            candidate = input("Enter the disk for Gentoo install (e.g., /dev/sda or /dev/nvme0n1): ").strip()
            if not candidate.startswith("/dev/"):
                candidate = "/dev/" + candidate
            if os.path.exists(candidate):
                confirm = input(f"ALL DATA ON {candidate} WILL BE LOST. Confirm device again: ")
                if confirm == candidate:
                    self.disk = candidate
                    self.disk_label = candidate.replace('/dev/', '')
                    break
                else:
                    print("Mismatch, try again.")
            else:
                print("Disk does not exist.")
        Logger.success(f"Disk set: {self.disk}")

    def pick_environment(self):
        Logger.header("ENVIRONMENT (VM or Metal)")
        print("Select your install environment:")
        print("  1) VMware   2) VirtualBox   3) Hyper-V   4) QEMU/KVM   5) Metal")
        env_map = { "1":"vmware", "2":"virtualbox", "3":"hyperv", "4":"qemu", "5":"metal" }
        while True:
            e = input("Env [1-5]: ").strip()
            if e in env_map:
                self.envtype = env_map[e]
                Logger.success(f"Env: {self.envtype}")
                break

    def pick_video_cards(self):
        if self.envtype == "vmware":
            self.video_cards = "vmware"
        elif self.envtype == "virtualbox":
            self.video_cards = "virtualbox"
        elif self.envtype == "hyperv":
            self.video_cards = "fbdev"
        elif self.envtype == "qemu":
            self.video_cards = "qxl"
        elif self.envtype == "metal":
            Logger.header("Select Physical GPU")
            print("  1) Intel   2) AMD   3) NVIDIA")
            while True:
                g = input("GPU [1-3]: ").strip()
                if g == "1":
                    self.video_cards = "i965,intel"
                    break
                elif g == "2":
                    self.video_cards = "amdgpu"
                    break
                elif g == "3":
                    self.video_cards = "nvidia"
                    break

    def pick_microcode(self):
        if self.envtype == "metal":
            Logger.header("Microcode/Firmware")
            print("  1) Intel microcode   2) AMD microcode   3) None")
            while True:
                c = input("CPU/Firmware [1-3]: ").strip()
                if c == "1":
                    self.cpu_vendor = "intel"
                    break
                elif c == "2":
                    self.cpu_vendor = "amd"
                    break
                elif c == "3":
                    self.cpu_vendor = None
                    break

    def pick_overlay_guru(self):
        print("Enable GURU overlay and devilspie2? (y/N)")
        resp = input().strip().lower()
        self.overlay_guru = resp == "y"

    def prompt_configuration(self):
        Logger.header("DESKTOP ENVIRONMENT")
        print("  1) Hyprland (Wayland, tiling)")
        print("  2) KDE Plasma (X11, full desktop)")
        while True:
            c = input("Desktop [1 or 2]: ").strip() or "1"
            if c == "1":
                self.desktop_env = "hyprland"
                break
            elif c == "2":
                self.desktop_env = "kde"
                break
        print("Use custom username/password/host/timezone? Y/N")
        resp = input().strip().upper()
        self.use_custom = resp == "Y"
        if not self.use_custom:
            self.username = "gentoo"
            self.hostname = "gentoo"
            self.timezone = "UTC"
            alphabet = string.ascii_letters + string.digits + string.punctuation
            gp = ''.join(secrets.choice(alphabet) for _ in range(16))
            self.user_password = self.root_password = gp
            print(f"Generated password for root and user: {Colors.WARNING}{gp}{Colors.ENDC}")
        else:
            self.username = input("Username: ").strip().lower()
            self.hostname = input("Hostname: ").strip().lower()
            self.timezone = input("Timezone [UTC]: ").strip() or "UTC"
            while True:
                pw1 = getpass.getpass("User password: ")
                pw2 = getpass.getpass("Repeat user password: ")
                if pw1 == pw2:
                    self.user_password = pw1
                    break
                else:
                    print("No match. Try again.")
            while True:
                pw1 = getpass.getpass("Root password: ")
                pw2 = getpass.getpass("Repeat root password: ")
                if pw1 == pw2:
                    self.root_password = pw1
                    break
                else:
                    print("No match. Try again.")
        print(f"\nConfig summary: {Colors.BOLD}")
        print(f"Desktop:  {self.desktop_env}")
        print(f"Disk:     {self.disk}")
        print(f"Env:      {self.envtype}")
        print(f"GPU:      {self.video_cards}")
        print(f"User/Host:{self.username}/{self.hostname}")
        print(f"Timezone: {self.timezone}")
        print(f"{Colors.ENDC}")
        input("Press ENTER to continue...")

    def partition_disk(self):
        Logger.header("PARTITIONING DISK")
        print(f"{Colors.WARNING}ALL DATA ON {self.disk} WILL BE DESTROYED!{Colors.ENDC}")
        response = input("Type YES to continue: ")
        if response != "YES":
            Logger.error("Cancelled.")
            sys.exit(1)
        cmds = [
            f"parted -s {self.disk} mklabel gpt",
            f"parted -s {self.disk} mkpart primary fat32 1MiB 1GiB",
            f"parted -s {self.disk} mkpart primary ext4 1GiB 100%",
            f"parted -s {self.disk} set 1 esp on",
        ]
        for c in cmds:
            rc = subprocess.call(c, shell=True)
            if rc: Logger.error(f"Failed: {c}"); sys.exit(1)
        time.sleep(2)
        subprocess.call("partprobe", shell=True)
        time.sleep(2)
        Logger.success("Partitioned.")

    def format_partitions(self):
        Logger.header("FORMATTING PARTITIONS")
        efi = f"{self.disk}1"
        root = f"{self.disk}2"
        cmds = [f"mkfs.fat -F32 {efi}", f"mkfs.ext4 -F {root}"]
        for c in cmds:
            rc = subprocess.call(c, shell=True)
            if rc: Logger.error(f"Failed: {c}"); sys.exit(1)
        Logger.success("Formatted partitions.")

    def mount_partitions(self):
        Logger.header("MOUNTING PARTITIONS")
        efi = f"{self.disk}1"
        root = f"{self.disk}2"
        os.makedirs(self.mount_point, exist_ok=True)
        subprocess.check_call(f"mount {root} {self.mount_point}", shell=True)
        efi_mount = f"{self.mount_point}/efi"
        os.makedirs(efi_mount, exist_ok=True)
        subprocess.check_call(f"mount {efi} {efi_mount}", shell=True)
        Logger.success(f"Mounted partitions at {self.mount_point}")

    def download_stage3(self):
        Logger.header("DOWNLOADING STAGE3")
        os.chdir(self.mount_point)
        subprocess.check_call("wget -q https://distfiles.gentoo.org/releases/amd64/autobuilds/latest-stage3-amd64-openrc.txt", shell=True)
        url = None
        with open("latest-stage3-amd64-openrc.txt") as f:
            for line in f:
                if line.startswith("#"): continue
                if "stage3-amd64-openrc" in line: url = line.split()[0]; break
        full_url = f"https://distfiles.gentoo.org/releases/amd64/autobuilds/{url}"
        stage3_file = url.split("/")[-1]
        subprocess.check_call(f"wget {full_url}", shell=True)
        subprocess.check_call(f"tar xpvf {stage3_file} --xattrs-include='*.*' --numeric-owner", shell=True)
        os.remove(stage3_file)
        os.remove("latest-stage3-amd64-openrc.txt")
        Logger.success("Extracted stage3.")

    def configure_make_conf(self):
        Logger.header("CONFIGURE make.conf")
        make_conf = f"{self.mount_point}/etc/portage/make.conf"
        nproc = os.cpu_count()
        if self.desktop_env == "hyprland":
            useflags = "wayland pipewire bluetooth wifi openrc elogind dbus vulkan opengl -systemd -gnome -pulseaudio -X -kde -plasma -qt5"
            profile = "default/linux/amd64/23.0/desktop"
        else:
            useflags = "X gtk qt5 qt6 pipewire bluetooth wifi openrc elogind dbus kde plasma vulkan opengl -systemd -gnome -pulseaudio -wayland"
            profile = "default/linux/amd64/23.0/desktop/plasma"
        config = f'''# Generated by Gentoo Faster v1.0
COMMON_FLAGS="-march=native -O2 -pipe"
CFLAGS="${{COMMON_FLAGS}}"
CXXFLAGS="${{COMMON_FLAGS}}"
MAKEOPTS="-j{nproc}"
EMERGE_DEFAULT_OPTS="--jobs=4 --load-average={nproc}"
USE="{useflags}"
VIDEO_CARDS="{self.video_cards}"
INPUT_DEVICES="libinput"
ACCEPT_LICENSE="*"
L10N="en-US"
GENTOO_MIRRORS="https://mirrors.mit.edu/gentoo-distfiles/"
'''
        with open(make_conf, "w") as f:
            f.write(config)
        with open(f"{self.mount_point}/etc/PROFILE", "w") as f:
            f.write(profile)
        Logger.success("make.conf written.")

    def copy_resolv_conf(self):
        subprocess.check_call(f"cp --dereference /etc/resolv.conf {self.mount_point}/etc/", shell=True)
        Logger.success("resolv.conf copied.")

    def mount_proc_sys_dev(self):
        Logger.header("MOUNTING VFS")
        cmds = [
            f"mount --types proc /proc {self.mount_point}/proc",
            f"mount --rbind /sys {self.mount_point}/sys",
            f"mount --make-rslave {self.mount_point}/sys",
            f"mount --rbind /dev {self.mount_point}/dev",
            f"mount --make-rslave {self.mount_point}/dev",
            f"mount --rbind /run {self.mount_point}/run",
            f"mount --make-rslave {self.mount_point}/run"
        ]
        for c in cmds: subprocess.check_call(c, shell=True)
        Logger.success("VFS mounted.")

    def create_chroot_script(self):
        Logger.header("GENERATING CHROOT INSTALL SCRIPT")
        profile = open(f"{self.mount_point}/etc/PROFILE").read().strip()
        pkgs = build_pkgs(self.desktop_env, self.envtype, self.video_cards, self.cpu_vendor, self.overlay_guru)
        pkgstr = " ".join(pkgs)
        guru_overlay_cmd = (
            "emerge --ask=n app-eselect/eselect-repository && eselect repository enable guru && emerge --sync guru"
            if self.overlay_guru else ""
        )
        plasma_sddm_x11 = (
            "mkdir -p /etc/sddm.conf.d && echo -e '[General]\\nDisplayServer=x11' > /etc/sddm.conf.d/10-wayland.conf && rc-update add sddm default"
            if self.desktop_env == "kde" else ""
        )
        kernel_microcode = ""
        if self.envtype == "metal":
            if self.cpu_vendor == "intel":
                kernel_microcode = "emerge --ask=n sys-firmware/intel-microcode"
            elif self.cpu_vendor == "amd":
                kernel_microcode = "emerge --ask=n sys-firmware/amd-ucode"
        chroot_script = f"""#!/bin/bash
set -e
source /etc/profile
export PS1="(chroot) $PS1"

{guru_overlay_cmd}

emerge-webrsync
emerge --sync
eselect profile set {profile}
emerge --ask=n --verbose --update --deep --newuse @world

ln -sf /usr/share/zoneinfo/{self.timezone} /etc/localtime
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale set en_US.utf8
env-update && source /etc/profile

USE="minimal" emerge --ask=n --oneshot libsndfile
emerge --ask=n sys-kernel/gentoo-kernel-bin sys-kernel/installkernel
{kernel_microcode}

ROOT_UUID=$(blkid -s UUID -o value {self.disk}2)
EFI_UUID=$(blkid -s UUID -o value {self.disk}1)

cat > /etc/fstab << F
UUID=${{ROOT_UUID}}  /      ext4  defaults,noatime  0 1
UUID=${{EFI_UUID}}   /efi   vfat  defaults,noatime  0 2
F

echo "{self.hostname}" > /etc/hostname
cat > /etc/hosts << H
127.0.0.1  localhost
::1        localhost
127.0.1.1  {self.hostname}
H

emerge --ask=n {pkgstr}

{plasma_sddm_x11}

useradd -m -G wheel,audio,video,usb,plugdev,seat -s /bin/bash {self.username}
echo "{self.username}:{self.user_password}" | chpasswd
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

rc-update add dbus default
rc-update add elogind default
rc-update add iwd default
rc-update add sshd default
rc-update add cronie default
rc-update add syslog-ng default
rc-update add ufw default
rc-update add chronyd default

echo 'rc_timeout_stopsec=5' >> /etc/rc.conf
echo "root:{self.root_password}" | chpasswd

echo "Install script finished!"
"""
        script_path = f"{self.mount_point}/root/install-chroot.sh"
        with open(script_path, "w") as f:
            f.write(chroot_script)
        os.chmod(script_path, 0o755)
        Logger.success("Chroot script created.")
        return script_path

    def run_chroot_install(self, script_path):
        Logger.header("CHROOT INSTALL")
        chroot_cmd = f"chroot {self.mount_point} /bin/bash /root/install-chroot.sh"
        rc = subprocess.call(chroot_cmd, shell=True)
        if rc != 0:
            Logger.error("Chroot failed!")
            sys.exit(1)
        Logger.success("Install finished.")

    def create_user_dotfiles(self):
        Logger.header("User dotfile/config population")
        user_home = os.path.join(self.mount_point, "home", self.username)
        os.makedirs(user_home, exist_ok=True)
        # Hyprland config
        if self.desktop_env == "hyprland":
            hypr_dir = f"{user_home}/.config/hypr"
            os.makedirs(hypr_dir, exist_ok=True)
            with open(f"{hypr_dir}/hyprland.conf", "w") as f:
                f.write("""monitor=,preferred,auto,1
exec-once = waybar
exec-once = mako
exec-once = swaybg -c "#1e1e2e"
exec-once = udiskie &
env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORM,wayland
env = MOZ_ENABLE_WAYLAND,1
input { kb_layout = us follow_mouse = 1 sensitivity = 0 touchpad { natural_scroll = true tap-to-click = true } }
general { gaps_in = 5 gaps_out = 10 border_size = 2 col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg col.inactive_border = rgba(595959aa) layout = dwindle }
decoration { rounding = 10 blur { enabled = true size = 3 passes = 1 } drop_shadow = yes shadow_range = 4 shadow_render_power = 3 col.shadow = rgba(1a1a1aee) }
animations { enabled = yes bezier = myBezier,0.05,0.9,0.1,1.05 animation = windows,1,7,myBezier animation = windowsOut,1,7,default,popin 80% animation = border,1,10,default animation = fade,1,7,default animation = workspaces,1,6,default }
dwindle { pseudotile = yes preserve_split = yes }
$mainMod = SUPER
bind = $mainMod,RETURN,exec,kitty
bind = $mainMod,E,exec,dolphin
bind = $mainMod,D,exec,rofi -show drun
bind = $mainMod,B,exec,chromium
bind = $mainMod,Q,killactive,
bind = $mainMod,M,exit,
bind = $mainMod,V,togglefloating,
bind = $mainMod,F,fullscreen,
bind = $mainMod,left,movefocus,l
bind = $mainMod,right,movefocus,r
bind = $mainMod,up,movefocus,u
bind = $mainMod,down,movefocus,d
bind = $mainMod,1,workspace,1
bind = $mainMod,2,workspace,2
bind = $mainMod,3,workspace,3
bind = $mainMod,4,workspace,4
bind = $mainMod,5,workspace,5
bind = $mainMod SHIFT,1,movetoworkspace,1
bind = $mainMod SHIFT,2,movetoworkspace,2
bind = $mainMod SHIFT,3,movetoworkspace,3
bind = $mainMod SHIFT,4,movetoworkspace,4
bind = $mainMod SHIFT,5,movetoworkspace,5
bind = ,PRINT,exec,grim -g \"$(slurp)\" - | swappy -f -
bind = ,XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bind = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind = ,XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
""")
        # Bashrc, kitty, etc -- easily add more as per your .txts
        with open(f"{user_home}/.bashrc", "w") as f:
            f.write("eval \"$(starship init bash)\"\neval \"$(zoxide init bash)\"\nalias ls='eza --icons --group-directories-first'\nalias ll='eza --icons --group-directories-first -l'\nalias la='eza --icons --group-directories-first -la'\nalias tree='eza --icons --tree'\nalias cd=\"z\"\n")
        with open(f"{user_home}/.bash_profile", "w") as f:
            f.write("if [ -z \"$WAYLAND_DISPLAY\" ] && [ \"$XDG_VTNR\" -eq 1 ]; then exec Hyprland; fi\n")
        kitty_dir = f"{user_home}/.config/kitty"
        os.makedirs(kitty_dir, exist_ok=True)
        with open(f"{kitty_dir}/kitty.conf", "w") as f:
            f.write("font_family FiraCode Nerd Font Mono\nfont_size 10.0\nforeground #CDD6F4\nbackground #1E1E2E\nbackground_opacity 0.95\ncursor #F5E0DC\nwindow_padding_width 10\n")
        Logger.success("User dotfiles created.")

    def run_all(self):
        self.pick_disk()
        self.pick_environment()
        self.pick_video_cards()
        self.pick_microcode()
        self.pick_overlay_guru()
        self.prompt_configuration()
        self.partition_disk()
        self.format_partitions()
        self.mount_partitions()
        self.download_stage3()
        self.configure_make_conf()
        self.copy_resolv_conf()
        self.mount_proc_sys_dev()
        script_path = self.create_chroot_script()
        self.run_chroot_install(script_path)
        self.create_user_dotfiles()
        Logger.header("DONE!")
        print("Install complete. Unmount all and reboot.")
        print(f"Username: {self.username}  Password: (see earlier)")
        print(f"Ready for first boot...")

if __name__ == "__main__":
    install = GentooInstaller()
    install.run_all()