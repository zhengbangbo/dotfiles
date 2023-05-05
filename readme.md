# Bang-Bo's Dotfiles

## Install Stow

### Install stow by script

```shell
sh ./install-stow.sh
```

### Install stow by manual

All dotfiles managed by stow, install stow first

```bash
# Ubuntu
apt install stow
# macOS
brew install stow
```

Use Stow

```bash
# set .stowrc
stow -vt ~ stow
```

## Install 3rd party softwares(options)

### Install by script(zsh)

```shell
sh ./install-zsh.sh
```

### Install by manual

The zsh, for example, need to run `install.zsh`.

```bash
# create symlink
stow {zsh,git}
```

## Check Also

- [zhengbangbo/vscode-settings](https://github.com/zhengbangbo/vscode-settings)

## Thanks

- [antfu/dotfiles](https://github.com/antfu/dotfiles)
- [keaising/dotfile](https://github.com/keaising/dotfile)  - managed by [stow](https://www.gnu.org/software/stow/)
