# Update software.
zypper --version

zypper addrepo https://download.opensuse.org/repositories/network/openSUSE_Tumbleweed/network.repo || true

sudo zypper ref
sudo zypper up -y
sudo zypper dup -y
