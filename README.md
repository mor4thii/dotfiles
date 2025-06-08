# dotfiles Repo

My dotfiles shared between machines. This will generally produce a Catppuccin-themed workspace with the tools I use every day.

The terminal emulator I use is Ghostty, the shell is zsh. I opted out of oh-my-zsh in favor of having more control.
Thus I use starship.rs as prompt and zap for plugin management.

I use taskwarrior and timewarrior for keeping track of things.

I currently migrate to neovim as my editor of choice.

In my toolchain I use sdkman and nvm to manage JVM and JS versions and I prefer pnpm over npm or yarn for dependency management in JS.
On my Mac, I use brew to install stuff.

## Supported tools

In no particular order...

- Ghostty
- zsh
  - sdkman
  - nvm
  - pnpm
  - brew
  - zap
- starship.rs
- taskwarrior
- timewarrior
- neovim
- ssh
- Plasma/kzones

## Tools I like

There are some more tools that I like to use on a daily basis.

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [rg](https://github.com/BurntSushi/ripgrep)
- [tldr](https://github.com/tldr-pages/tldr)
- [thefuck](https://github.com/nvbn/thefuck)
- [miniforge](https://github.com/conda-forge/miniforge)

## For wallpapers

- https://simpledesktops.com/browse/

Or use one of the ones in the Wallpapers folder, kindly provided by https://github.com/Noctax/Noctax-Wallpapers

## CachyOS

Follow instruction on https://wiki.cachyos.org/ for installing using the GUI installer iso, choosing 
- systemd-boot,
- btrfs,
- Plasma Desktop

Then, follow steps for [post install](https://wiki.cachyos.org/configuration/post_install_setup/) including apparmor and zsh switch.
Also follow steps regarding Steam in the [Gaming](https://wiki.cachyos.org/configuration/gaming/) section. Don't forget to set games to using performance mode

```
LD_PRELOAD="" game-performance %command%
```

Use `active` pstate and powersafe governor, also as preference, c.f. [General System Tweaks](https://wiki.cachyos.org/configuration/general_system_tweaks/)

### (For now) Manual steps
Set up git SSH key, clone this repo, then:

```shell
sudo pacman -S ghostty neovim tree stow
```

```shell
curl -sS https://starship.rs/install.sh | sh
```

```shell
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k
```

```shell
stow -t $HOME --stow ghostty git nvim profile ssh-priv starship zsh
```

```shell
chsh -s /usr/bin/zsh
```

```shell
sudo pacman -S obs-studio obs-vkcapture lib32-obs-vkcapture alsa-scarlett-gui
```

- In KDE System Settings, enable HDR.
- Also check Audio setup
- Apply https://github.com/catppuccin/firefox (Moccha Mauve)
- Apply https://github.com/catppuccin/kde (Moccha Mauve) 
- In KDE, X11 sessions can be switched on and off in System Settings. Search for sddm

### Bluetooth

CachyOS, as of time of writing, provides bluetoothctl for bluetooth device management.
To connect to the XBox Controller, the following steps can help

```shell
# Puts me into [bluetooth]# prompt
bluetoothctl
```

```shell
# Make sure the right bt controller is used
show
```

```shell
power on
discoverable on
pairable on
```

```shell
# Will start printing out discovered devices, find right MAC of target device
scan on
```

```shell
pair <dev>
```

```shell
# This should also turn off discoverable, double-check with `show`
scan off
```

```shell
connect <dev>
trust <dev>
```

## Update Keychron firmware on Linux

See [QMK FAQ](https://docs.qmk.fm/faq_build#linux-udev-rules) for rules file to make the [launcher](https://launcher.keychron.com/) connect to the keyboard correctly.
