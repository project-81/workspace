# raspberrypi

1. Run `winget rpi-imager` in PowerShell.
1. Open "Raspberry Pi Imager" via Start Menu (search for it).
1. Choose "Raspberry Pi OS Lite (64-Bit)" in "Raspberry Pi OS (other)" menu.

## Notes

Trying to install this: https://github.com/dorssel/usbipd-win

Had to restart Terminal to get `usbipd` to be available on PATH.

https://github.com/dorssel/usbipd-win/wiki/WSL-support

```
usbipd wsl attach --distribution openSUSE-Tumbleweed --busid 1-24
```

getting client: https://software.opensuse.org/download/package?package=usbip&project=network

https://github.com/microsoft/WSL/issues/7770#issuecomment-1140443247

Down a rabbit hole of re-building WSL 2 kernel.
