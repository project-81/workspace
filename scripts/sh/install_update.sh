# Update software.
zypper --version

zypper addrepo https://download.opensuse.org/repositories/network/openSUSE_Tumbleweed/network.repo || true

sudo_cmd zypper ref
sudo_cmd zypper up -y
sudo_cmd zypper dup -y
