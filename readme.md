# Bang-Bo's Dotfiles

## Install Stow

All dotfiles managed by stow, install stow first

```bash
# Ubuntu
apt install stow
# macOS
brew install stow
```

## Install 3rd party softwares(options)

The zsh, for example, need to run `install.zsh`.

## Use Stow
```bash
# set .stowrc
stow -vt ~ stow

# create symlink
stow {zsh,git}
```

## Check Also

- [zhengbangbo/vscode-settings](https://github.com/zhengbangbo/vscode-settings)

## Thanks

- [antfu/dotfiles](https://github.com/antfu/dotfiles)
- [keaising/dotfile](https://github.com/keaising/dotfile)  - managed by [stow](https://www.gnu.org/software/stow/)
