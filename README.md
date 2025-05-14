# dotfiles Repo

My dotfiles shared between machines. This will generally produce a Catppuccin-themed workspace with the tools I use every day.

```bash
stow -t $HOME --stow package [package...]
```

```bash
stow -t $HOME --stow zsh ghostty starship nvim
```

The terminal emulator I use is Ghostty, the shell is zsh. I opted out of oh-my-zsh in favor of having more control.
Thus I use starship.rs as prompt and zap for plugin management.

I use taskwarrior and timewarrior for keeping track of things.

I currently migrate to neovim as my editor of choice.

In my toolchain I use sdkman and nvm to manage JVM and JS versions and I prefer pnpm over npm or yarn for dependency management in JS.
On my Mac, I use brew to install stuff.

## For wallpapers

- https://simpledesktops.com/browse/

Or use one of the ones in the Wallpapers folder, kindly provided by https://github.com/Noctax/Noctax-Wallpapers

## Arch installation
pacman -S git yay-bin dunst wofi ranger xdg-user-dirs man-db man-pages texinfo playerctl brightnessctl fastfetch broadcom-bt-firmware tree wev

pacman -S ghostty ghostty-shell-integration ghostty-terminfo vi vim neovim zsh starship stow
yay hyprland-git

pacman -S mesa vulkan-radeon

pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

pacman -S hyprpolkitagent
systemctl --user enable --now hyprpolkitagent.service

pacman -S waybar

### Networking

```bash
➜  ~ cat /etc/systemd/network/20-wired.network
[Match]
Name=enp42s0

[Link]
RequiredForOnline=routable

[Network]
DHCP=yes
```

```bash
➜  ~ file /etc/resolv.conf
/etc/resolv.conf: symbolic link to ../run/systemd/resolve/stub-resolv.conf
```

```bash
ip link enp42s0 up
```

```bash
systemctl start systemd-network.service
systemctl enable systemd-network.service
```

```bash
systemctl start systemd-resolved.service
systemctl enable systemd-resolved.service
```
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

## TODO
- https://github.com/anametologin/krohnkite
