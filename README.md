# Introduction
Installing macOS themes on your favourite Linux Distro.

# Requirements
- **Operating System** : Any **Arch** based OS like **Manjaro**, **Archman** etc.
- **Desktop Environment** : **Gnome**

# ScreenShots
![1](https://raw.githubusercontent.com/dikeckaan/macjaro/master/screenshoot1.png)
![2](https://raw.githubusercontent.com/dikeckaan/macjaro/master/screenshoot2.png)
![3](https://raw.githubusercontent.com/dikeckaan/macjaro/master/screenshoot3.png)
![4](https://raw.githubusercontent.com/dikeckaan/macjaro/master/screenshot4.png)

# Tested on
- **Manjaro** **Linux** with **Gnome 3.34.4**


# This Customization Pack Includes
- 2 **_GTK_** Themes
- 2 **_Gnome Shell_** Themes
- 2 **_Cursor_** Themes
- 4 **_Icon_** Themes
- 2 **_Wallpapers_**
- 2 **_Fonts_** (For Gnome Shell)
- 1 **_Plymouth_** Theme (Optional, only for Ubuntu)

# Credits
### GTK Themes
- [paulxfce](https://www.gnome-look.org/p/1241688/)
### Gnome Shell Themes
- [unc926](https://www.gnome-look.org/p/1213208/)
### Cursor Themes
- [dcomim](https://www.gnome-look.org/p/1241071/)
- [krourke](https://www.gnome-look.org/p/1148692/)
### Icon Themes
- [krourke](https://www.gnome-look.org/p/1148695/)
- [umayanga](https://www.gnome-look.org/p/1102582/)
- [zayronXIO](https://www.gnome-look.org/p/1210856/)
### Plymouth Theme
- [LozanoJack](https://www.gnome-look.org/p/1009320/)

### Script Based on
- [debugster](https://github.com/debugster/GnomeTweaks)

# Install macOS Themes on Manjaro
- **xterm** must be installed in the system. To install **xterm**, open **Terminal** and execute:
```bash
git clone https://github.com/dikeckaan/macjaro.git
sudo pacman -Syu xterm --assume-yes
cd macjaro
chmod +x macjaro.sh
./macjaro.sh
```
- Log Out/Restart your computer.

### Caution
- Don't run this script as **sudo**.
- This script will open **xterm** several times to install some required packages. When promted, enter your password on **xterm** window.

- Log Out/Restart your computer.


### Albert Spotlight (macOS like Spotlight)
If you like to install **Albert Spotlight**, you may follow:
- Open **Terminal** end execute:

```bash
yay -S albert
```
- After installation, you can open Albert from Menu/Dash and set hotkey to activate albert.
