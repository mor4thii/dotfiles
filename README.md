# dotfiles Repo

My dotfiles shared between machines. This will generally produce a Catppuccin-themed workspace with the tools I use every day.

The terminal emulator I use is ghostty, the shell is zsh. I opted out of oh-my-zsh in favor of having more control.
Thus I use starship.rs as prompt and zap for plugin management. I currently migrate to neovim as my editor of choice.

## TODO

- Better job at de-duplicating work and private `.zshrc` file

## Supported tools

Shared configs that are the same on every machine are just the following.

- ghostty
- nvim
- starship

On my private machines, I have configuration for these tools.

- electron
- git
- kzones
- plasma
- profile
- ssh-priv

On my work machine, I use these tools in addition to the shared list above.

- git-work
- ideavim
- profile-work
- ssh-work
- task
- timew

## Tools I like

There are some more tools that I like to use on a daily basis, but that have no dedicated configuration to share between machines.
From this list, we can install `fd`, `fzf`, `rg`, `thefuck`, and `tldr` using `pacman`.

- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [rg](https://github.com/BurntSushi/ripgrep)
- [thefuck](https://github.com/nvbn/thefuck)
- [tldr](https://github.com/tealdeer-rs/tealdeer)

These other tools need manual steps:

- [paru](https://github.com/Morganamilo/paru)
- [sdkman](https://sdkman.io/)
- [pnpm](https://pnpm.io/installation#on-posix-systems)

Those are optional and things I occasionally need

- [miniforge](https://github.com/conda-forge/miniforge)
- [TeXlive](https://www.tug.org/texlive/quickinstall.html)

## CachyOS

_BIOS_: Turn off Secure Boot, CSM, and set Legacy USB Support to Auto!

Follow instruction on the [CachyOS wiki](https://wiki.cachyos.org/) for installing using the GUI installer iso, choosing

- systemd-boot,
- XFS,
- Niri Desktop

Prefer manual partitioning, see [COS Desktop Install](https://wiki.cachyos.org/installation/installation_on_root/).

Only deselect 'COS shell configurations' for maximum stability of the installer.

Then, follow steps for [post install](https://wiki.cachyos.org/configuration/post_install_setup/) including apparmor and zsh switch.
Also follow steps regarding Steam in the [Gaming](https://wiki.cachyos.org/configuration/gaming/) section. Don't forget to set games to using performance mode

```
LD_PRELOAD="" game-performance %command%
```

Use `active` pstate and powersafe governor, also as preference, c.f. [General System Tweaks](https://wiki.cachyos.org/configuration/general_system_tweaks/)

## Installation

### Common steps

Set up git SSH key, clone this repo and install the additional tools listed above.

Remember to check ssh key file and directory permissions. To fix them, use something similar to this:

```shell
chmod 700 ~/.ssh/
chmod 644 ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
```

### (For now) Manual steps

Then:

```shell
sudo pacman -S ghostty neovim tree stow fd fzf ripgrep tealdeer thefuck lazygit alsa-scarlett-gui cliphist inter-font ttf-jetbrains-mono-nerd
```

```shell
curl -sS https://starship.rs/install.sh | sh
```

```shell
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k
```

```shell
stow -t $HOME --stow ghostty git lazygit nvim profile ssh-priv starship zsh electron niri
```

```shell
paru -S wl-clipboard discord-canary
```

Reboot and continue in ghostty from now

```shell
pnpm runtime set node lts -g
```

```shell
sdk install java 25-zulu
```

```shell
sdk install maven 3.9.16
```

```shell
pnpm install -g neovim prettier
```

### If using Niri/Noctalia

CachyOS has some opinionated Niri settings.
To setup ghostty to launch at SUPER-Return, change ~/.config/niri/cfg/keybinds.kdl accordingly.
For good measure, also change it in Noctalia settings through the bar.

### If using KDE

In KDE System Settings

- Quick Settings -> Animation Speed: instant
- Keyboard -> Key Bindings -> Compose key to right CTRL
- Check Audio setup
- Display & Monitor (For LG C2)
  - 120Hz
  - Adaptive Sync always
  - RGB Full
  - Enable HDR & after Apply, calibrate
  - Prefer Color accuracy
  - Automatic color resolution limit
  - sRGB 40%
- Colors & Themes -> Apply Breeze Dark again
- Colors & Themes -> Splash Screen: Reapply Breeze
- Colors & Themes -> SDDM: Apply Plasma Settings
- Colors & Themes -> Boot Splash Screen: Apply BGRT
- Apply the kzones layout in KDE kwin settings

> In KDE, X11 sessions can be switched on and off in System Settings. Search for sddm

### For work (MacOS)

Install `brew`, then run the following

```shell
brew install fzf ripgrep thefuck tealdeer fd neovim tree stow lazygit starship
```

```shell
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 -k
```

```shell
stow -t $HOME --stow ghostty git lazygit nvim profile-work ssh-work starship zsh-work
```

```shell
stow -t $HOME/Repositories/c49 --stow git-work
```

### For wallpapers

There is a web resource I tend to use to search for wallpapers.

- <https://simpledesktops.com/browse/>

Or use one of the ones in the Wallpapers folder, kindly provided by <https://github.com/Noctax/Noctax-Wallpapers> and <https://github.com/orangci/walls-catppuccin-mocha>

### Fonts

I use [Inter](https://rsms.me/inter/download/) for UI and [JetBrains Mono (Nerd Font)](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip) for monospaced fonts.

### Backup

A simple backup logic backs up my home directory to an external drive.
It involes

```shell
lsblk -f
```

to find the hard drive target to add it under `/etc/fstab`, for example as exfat drive:

```shell
UUID=xxxx-xxxx                            /media/backup  exfat  noauto,x-systemd.automount,x-systemd.device-timeout=5,nofail,uid=1000,gid=1000,umask=000  0  0
```

Make sure to create the target folder.

```shell
sudo mkdir -p /media/backup
sudo chown -R user:user /media/backup
```

Stow the needed files

```shell
stow -t $HOME --stow backup systemd
```

Then run the backup script stowed to `~/backup.sh`, either manually or automatically using cronjobs or systemd.

#### systemd backup

The backup can be run once a day, persistently, meaning missed backups will be executed next time.

```shell
# Reload systemd to see new files
systemctl --user daemon-reload

# Enable timer to start on boot
systemctl --user enable backup.timer

# Start the timer now
systemctl --user start backup.timer

# Check status
systemctl --user status backup.timer
systemctl --user list-timers
systemctl --user status backup.service
journalctl --user -u backup.service -f

# Stop or kill
systemctl --user stop backup.service
systemctl --user kill backup.service
```

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

## Troubleshooting

If there are issues regarding PGP keys when running `pacman`, the following commands update the pacman keys.

```
sudo pacman-key --refresh-keys
sudo pacman -Sy
```

## Update Keychron firmware on Linux

See [QMK FAQ](https://docs.qmk.fm/faq_build#linux-udev-rules) for rules file to make the [launcher](https://launcher.keychron.com/) connect to the keyboard correctly.
