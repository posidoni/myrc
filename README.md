# My config files

## Installation

1) Configs

```sh
$ mkdir -pv "$HOME/myrc"
$ git clone <repo> "$HOME/myrc" && cd "$HOME/myrc"
$ git submodule update --init --recursive # to update tmux plugin manager + omz

# ❗it is non-trivial to make install script that is compatible with arbitrary systems, please,
# read source code before launching anything. Also you are responsible for
# manual backup of existing configs, especially ENV, including critical system-wide confs in /etc/*
# if you are not confident in your sh / vi / tmux troubleshooting abilities, please, don't install this stuff
$ chmod +x local/bin/install_configs.sh
$ sudo local/bin/install_configs.sh
```

2) Download NVim, patch it, compile & install

```sh
$ local/bin/local/bin/install_latest_nvim.sh # download latest nvim
$ local/bin/patch_neovim.sh # patch neovim variable 'VIMINIT' -> 'NVIMINIT' to decouple vim and nvim

# patching by scripts may not be forward compatible (tested on NVim v0.9)
# generally, it is easy to navigate & patch nvim sources
#
# also you may want to consider this popular patch from nvim-ufo issues
# https://github.com/kevinhwang91/nvim-ufo/issues/4
```

3) Bootstrap Tmux + Install TPM plugins

```sh
1. launch tmux session
2. press <leader> + i to install TMP plugins # in my config tmux leader is `~`
```

4) Install NVim plugins (Lazy + TS Parsers)

```sh
1. launch nvim
2. use lazy to install plugins `:Lazy install`
3. install TreeSitter parsers `:TSInstall all`
```

## Terminal

- Recommended terminal emulator: [WezTerm for OS X](https://wezfurlong.org/wezterm/index.html)
- [FiraCode Nerd Font with ligatures & default icons](https://github.com/ryanoasis/nerd-fonts) font or any other font with icons must be used by terminal emulator to render icons properly

## Nvim config

- My Neovim config is written with mostly lua and uses most modern nvim ecosystem plugins. I try to keep it up to date with latest NVim community developments on the best effort basis.
- This config is compatible with both console Nvim & GUI versions

![C workflow](./assets/2024-01-02%2017.03.50.jpg)
![C workflow](./assets/2024-01-02%2017.03.54.jpg)
![C workflow](./assets/2024-01-02%2017.03.56.jpg)

- Old config look with Neovide GUI (before v3)

![Lua workflow](./assets/nvim_lua_2.png)
![Lua plugins](./assets/nvim_lua_plugins.png)

## Credits

- [@bezlant](https://github.com/bezlant)
- [TJ DeVries](https://github.com/tjdevries) - one of NVim enthusiasts delivered a great [talk](https://www.youtube.com/watch?v=IK_-C0GXfjo) on the concept of PDE, which I absolutely recommend checking out.
