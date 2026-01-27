#!/usr/bin/env python3
"""
hamclock-install.py - Build and install Ham Clock from source.
Works on Arch Linux and Debian-based systems.
Source: https://www.clearskyinstitute.com/ham/HamClock/
"""

import argparse
import os
import shutil
import subprocess
import sys
import tempfile

SOURCE_URL = "https://www.clearskyinstitute.com/ham/HamClock/ESPHamClock.zip"
SOURCE_DIR = "ESPHamClock"
INSTALL_PATH = "/usr/local/bin"

RESOLUTIONS = {
    "800x480":    "hamclock-800x480",
    "1600x960":   "hamclock-1600x960",
    "2400x1440":  "hamclock-2400x1440",
    "3200x1920":  "hamclock-3200x1920",
}

DEPS_ARCH = ["curl", "make", "gcc", "libx11", "libxcb"]
DEPS_DEBIAN = ["curl", "make", "g++", "xorg-dev", "xdg-utils"]

DESKTOP_ENTRY = """\
[Desktop Entry]
Name=Ham Clock
Comment=Amateur Radio Clock and Space Weather
Exec=hamclock
Type=Application
Terminal=false
Categories=Utility;HamRadio;
"""


def log(msg):
    print(f"\033[1;34m[hamclock]\033[0m {msg}", flush=True)


def log_error(msg):
    print(f"\033[1;31m[hamclock]\033[0m {msg}", flush=True)


def run(cmd, cwd=None, check=True, sudo=False):
    if sudo:
        cmd = ["sudo"] + cmd
    log(f"  $ {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd, check=check)
    return result.returncode


def detect_distro():
    if os.path.exists("/etc/arch-release"):
        return "arch"
    if os.path.exists("/etc/debian_version"):
        return "debian"

    # fallback: check for pacman or apt
    if shutil.which("pacman"):
        return "arch"
    if shutil.which("apt-get"):
        return "debian"

    return None


def install_deps(distro):
    log(f"Installing dependencies for {distro}...")
    if distro == "arch":
        run(["pacman", "-S", "--needed", "--noconfirm"] + DEPS_ARCH, sudo=True)
    elif distro == "debian":
        run(["apt-get", "update"], sudo=True)
        run(["apt-get", "-y", "install"] + DEPS_DEBIAN, sudo=True)


def download_source(work_dir):
    zip_path = os.path.join(work_dir, "ESPHamClock.zip")
    log(f"Downloading source from {SOURCE_URL}")
    run(["curl", "-L", "-o", zip_path, SOURCE_URL])
    log("Extracting source...")
    run(["unzip", "-o", zip_path, "-d", work_dir])
    return os.path.join(work_dir, SOURCE_DIR)


def build(source_dir, target):
    nproc = os.cpu_count() or 1
    log(f"Building {target} with {nproc} jobs...")
    run(["make", f"-j{nproc}", target], cwd=source_dir)


def install(source_dir):
    log("Installing to /usr/local/bin/...")
    run(["make", "install"], cwd=source_dir, sudo=True)


def create_desktop_entry():
    desktop_dir = os.path.expanduser("~/.local/share/applications")
    os.makedirs(desktop_dir, exist_ok=True)
    desktop_path = os.path.join(desktop_dir, "hamclock.desktop")
    with open(desktop_path, "w") as f:
        f.write(DESKTOP_ENTRY)
    log(f"Desktop entry created at {desktop_path}")


def verify_install():
    hamclock = shutil.which("hamclock")
    if hamclock:
        log(f"Ham Clock installed at {hamclock}")
        return True
    # check alternate names
    for name in ["hamclock-big", "hamclock-1600x960", "hamclock-800x480"]:
        path = shutil.which(name)
        if path:
            log(f"Ham Clock installed at {path}")
            return True
    return False


def list_resolutions():
    print("\nAvailable resolutions:")
    print("  800x480    - Small (Raspberry Pi default)")
    print("  1600x960   - Medium (recommended for desktop)")
    print("  2400x1440  - Large")
    print("  3200x1920  - Extra large (4K displays)")
    print()


def main():
    parser = argparse.ArgumentParser(
        description="Build and install Ham Clock from source.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="Example: ./hamclock-install.py --resolution 1600x960"
    )
    parser.add_argument(
        "--resolution", "-r",
        choices=RESOLUTIONS.keys(),
        default="1600x960",
        help="Display resolution (default: 1600x960)"
    )
    parser.add_argument(
        "--list-resolutions", "-l",
        action="store_true",
        help="List available resolutions and exit"
    )
    parser.add_argument(
        "--skip-deps",
        action="store_true",
        help="Skip dependency installation"
    )
    parser.add_argument(
        "--no-desktop",
        action="store_true",
        help="Skip .desktop file creation"
    )
    parser.add_argument(
        "--build-dir",
        default=None,
        help="Build directory (default: temporary directory)"
    )
    parser.add_argument(
        "--keep-source",
        action="store_true",
        help="Keep source directory after install"
    )
    args = parser.parse_args()

    if args.list_resolutions:
        list_resolutions()
        sys.exit(0)

    target = RESOLUTIONS[args.resolution]

    print()
    print("╔══════════════════════════════════════════╗")
    print("║          Ham Clock Installer             ║")
    print("║   https://clearskyinstitute.com/ham/     ║")
    print("╚══════════════════════════════════════════╝")
    print()
    log(f"Target: {target} ({args.resolution})")

    # Detect distro
    distro = detect_distro()
    if distro is None:
        log_error("Could not detect distro. Supported: Arch Linux, Debian/Ubuntu.")
        log_error("Use --skip-deps and install dependencies manually.")
        sys.exit(1)
    log(f"Detected distro: {distro}")

    # Install dependencies
    if not args.skip_deps:
        install_deps(distro)
    else:
        log("Skipping dependency installation.")

    # Check for unzip
    if not shutil.which("unzip"):
        log("Installing unzip...")
        if distro == "arch":
            run(["pacman", "-S", "--needed", "--noconfirm", "unzip"], sudo=True)
        elif distro == "debian":
            run(["apt-get", "-y", "install", "unzip"], sudo=True)

    # Set up build directory
    if args.build_dir:
        work_dir = os.path.abspath(args.build_dir)
        os.makedirs(work_dir, exist_ok=True)
        cleanup = False
    else:
        work_dir = tempfile.mkdtemp(prefix="hamclock-")
        cleanup = not args.keep_source

    log(f"Build directory: {work_dir}")

    try:
        # Download and extract
        source_dir = download_source(work_dir)

        # Build
        build(source_dir, target)

        # Install
        install(source_dir)

        # Desktop entry
        if not args.no_desktop:
            create_desktop_entry()

        # Verify
        print()
        if verify_install():
            log("Build complete. Run 'hamclock' to launch.")
            log("First launch will open the setup wizard.")
        else:
            log_error("Binary not found in PATH after install.")
            log_error(f"Check {INSTALL_PATH}/ manually.")
            sys.exit(1)

    except subprocess.CalledProcessError as e:
        log_error(f"Command failed with exit code {e.returncode}")
        sys.exit(1)
    finally:
        if cleanup:
            log(f"Cleaning up {work_dir}")
            shutil.rmtree(work_dir, ignore_errors=True)
        elif not args.build_dir:
            log(f"Source kept at {work_dir}")

    print()


if __name__ == "__main__":
    main()
