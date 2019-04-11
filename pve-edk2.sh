#Building the fixed pve-edk2-firmware
# Add missing locale
export LC_ALL=en_US.UTF-8
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Add tools and build dependencies:
apt-get update
apt-get install build-essential git lintian debhelper iasl nasm \
  python uuid-dev gcc-aarch64-linux-gnu bc -y

# Clone my patched source
git clone -b macos-support https://github.com/thenickdude/pve-edk2-firmware.git

# Build it
cd pve-edk2-firmware
make
