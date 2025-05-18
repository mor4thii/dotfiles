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

### Bluetooth

CachyOS, as of time of writing, provides bluetoothctl for bluetooth device management.
To connect to the XBox Controller, the following steps can help

```
# Puts me into [bluetooth]# prompt
bluetoothctl
```
```
# Make sure the right bt controller is used
show
```
```
power on
discoverable on
pairable on
```
```
# Will start printing out discovered devices, find right MAC of target device
scan on
```
```
pair <dev>
```
```
# This should also turn off discoverable, double-check with `show`
scan off
```
```
connect <dev>
trust <dev>
```

### (For now) Manual steps
Set up git SSH key, clone this repo, then:

```zsh
sudo pacman -S ghostty neovim tree stow
```

```zsh
curl -sS https://starship.rs/install.sh | sh
```

```zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k
```

```zsh
stow -t $HOME --stow ghostty git nvim profile ssh-priv starship zsh
```

```zsh
chsh -s /bin/zsh
```
