# Gentoo Faster v1.0: An Automated, Universal Gentoo Installer

A fully interactive Python script for automating Gentoo Linux installation with support for Hyprland or KDE, on real hardware or in any virtual machine.

## Features

- Fully branch-aware automation: Hyprland, KDE, VM/metal, and all GPU/microcode combinations supported
- Interactive: select install disk, GPU, environment (VM type or metal), overlays, and desktop environment
- Error checking: root status, device presence, network, and all dependencies are checked before install
- Best-practice partitioning: prompts for explicit disk selection and double confirmation before destructive actions
- Gentoo-native: pure `emerge` and Gentoo overlays only – never any Arch, Pacman, or AUR
- Modern stack: Hyprland (Wayland) or KDE Plasma (X11), PipeWire, OpenRC
- Development ready: git, vim, modern CLI tools, and more
- Pre-configured: Hyprland, Waybar, Kitty, and all user dotfiles written per your config and DE choice

## What Gets Installed

### System
- **Init:** OpenRC
- **Kernel:** gentoo-kernel-bin (prebuilt, quick setup)
- **Bootloader:** systemd-boot
- **DE/WM:** choice of Hyprland (Wayland) or KDE Plasma (X11)
- **Audio:** PipeWire + WirePlumber

### Desktop Environments
At install time, you choose:
- **Hyprland:** Minimal Wayland compositor, Waybar, Rofi (Wayland), Mako, Swaylock, themed bash, and more
- **KDE Plasma:** Full desktop suite, SDDM, proper profile and X11 enforced, full KDE apps

### Core Applications and CLI Tools

- Chromium (browser)
- VLC (media player)
- GIMP, Inkscape (graphics)
- LibreOffice (office suite)
- Git, GitHub CLI (development)
- Starship – prompt, Zoxide – smart cd, Eza – modern ls, Fastfetch – system info, and more

### Fonts & Themes

- FiraCode Nerd Font, Noto, Noto CJK, Noto Emoji, Papirus icon theme
- All configs and theming are prewritten to user directories

## Requirements

- 4GB+ RAM (8GB+ strongly recommended)
- At least 50GB disk space
- 2+ CPU cores
- Internet connection (Ethernet or WiFi)

## Quick Start

1. Boot the Gentoo Minimal Install ISO (on real hardware or any VM)
2. Get networking online
3. Download this script to /tmp:
    ```bash
    wget https://raw.githubusercontent.com/YOUR_REPO/gentoo-installer.py
    chmod +x gentoo-installer.py
    ```
4. Run the installer:
    ```bash
    python3 gentoo-installer.py
    ```
5. Follow all interactive prompts (disk selection, environment, GPU, etc.)
6. Wait for final instructions and reboot when done

## Post-Install

- All user configs are in `/home/<user>/.config/` (`hypr/`, `waybar/`, `kitty/`, etc.)
- Update your system:
    ```bash
    emerge --sync
    emerge -avuDN @world
    ```
- Log in as your configured user. On TTY1, Hyprland will launch automatically (if you chose Hyprland).
- For KDE, log in via SDDM.

## Adding GURU Overlay

Optional but available as a single prompt during install.
You can also do it later:
```bash
emerge --ask app-eselect/eselect-repository
eselect repository enable guru
emerge --sync guru
```

## Disk Layout

- EFI partition (FAT32): 1GB (first partition, /efi)
- Root partition (ext4): remainder of disk (/)

This is set up safely and interactively, so nothing will be destroyed without confirmation.

## Bootloader

systemd-boot is configured for you and all UUIDs/parameters are handled.

## Services Enabled (OpenRC)

- dbus
- elogind
- iwd (WiFi)
- sshd (OpenSSH)
- cronie
- syslog-ng
- ufw
- chronyd
- Any VM guest additions (if relevant)

## Troubleshooting

**Installation issues**:  
If installation or the chroot phase fails, you can re-chroot and run the install script again:
```
mount /dev/sdXN /mnt/gentoo
mount /dev/sdXN /mnt/gentoo/efi
mount --rbind /dev /mnt/gentoo/dev
mount --rbind /sys /mnt/gentoo/sys
mount --rbind /proc /mnt/gentoo/proc
chroot /mnt/gentoo /bin/bash
bash /root/install-chroot.sh
```

**No Internet on first boot:**  
Start iwd and connect via `iwctl`, then `rc-update add iwd default` so WiFi is automatic.

**Hyprland or SDDM won’t start:**  
Check logs in `~/.local/share/hyprland/` or see `/var/log/` for X11 / SDDM.

## Architecture and File Structure

This installer is two-phase:  
- **Phase 1 (Python):** Disk partitioning, formatting, downloading stage3, mounting, pre-chroot setup
- **Phase 2 (generated Bash):** Portage sync, profile, update, all package installs, user/config setup

Structure:
```
/mnt/gentoo/
├── efi/
│   └── loader/
│       ├── loader.conf
│       └── entries/
│           └── gentoo.conf
├── root/
│   └── install-chroot.sh
└── home/
    └── <user>/
        └── .config/
            ├── hypr/
            ├── waybar/
            └── kitty/
```

## License

MIT License – modify, improve, or distribute as you see fit.
