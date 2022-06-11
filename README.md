# 1.Dotbot
Using [Dotbot](https://github.com/anishathalye/dotbot) to manage dotfiles.Here is a quick [tutorial](https://www.elliotdenolf.com/posts/bootstrap-your-dotfiles-with-dotbot) about how to use Dotbot to download your dotfiles on a new machine.
1. Basically, make a directory named Dotfiles on a new machine, init a git repo, clone dotbot repo as submodule, copy the install script in "dotbot/tools/git-submodule/install", and then touch a config file named "install.config.yaml".
2. Then config the yaml file about where you place the dotfiles and select which dotfiles you used on that new machine.The key is to config `install.conf.yaml`.
3. Set the dotfiles like zshrc, vimrc, tmux.conf.yaml, gitconfig or aliases and so on.Then, run the install script. 

```
mkdir Dotfiles && cd Dotfiles
git init
git submodule add https://github.com/anishathalye/dotbot
cp dotbot/tools/git-submodule/install .
touch install.conf.yaml
```

Install a dotbot plugin named [dotbot-asdf](https://github.com/sobolevn/dotbot-asdf.git) and modify the install script as required.This plugin help to manage multiple programming lanaguage's dependecies and versions as a whole.

```
mkdir dotbot-plugins && cd dotbot-plugins
git submodule add https://github.com/sobolevn/dotbot-asdf.git
echo '"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" --plugin-dir dotbot-asdf -c "${CONFIG}" "${@}"' >> ../install
```

# 2.Install.conf.yaml
Go through the install.conf.yaml file. 
1. Some useful functions written in scripts directory is syslinked in `~/bin`.
2. Then configure vim editor and its plugins. 
3. Next configure zsh shell by using oh-my-zsh setup and zshrc file, then turn to zgenom to manage its plugins.
4. Configure tmux through tmux.conf file.


# 3.Scripts
I copy the gstate function in scripts from [here](https://github.com/denolfe/dotfiles/blob/master/scripts/gstate) for the beginning to organize my dotfiles.So I can add some extra scripts in the future. 

# 4.Vim 
1. Use vimrc file to customize vim editor where I copy the configuration file from [here](https://github.com/anishathalye/dotfiles/blob/master/vimrc) to start with.
2. vim plugins is managed by built-in mananger, so just add the plugin submodule you need in vim/pack/vendor/start.To start with, I add [ctrlp](https://github.com/ctrlpvim/ctrlp.vim.git) vim plugin through `git submodule add https://github.com/ctrlpvim/ctrlp.vim.git` under the folder of `/vim/pack/vendor/start/`.
3. Setup vim [solarized theme](https://github.com/altercation/vim-colors-solarized) through `git submodule add https://github.com/altercation/vim-colors-solarized.git` under the folder of `vim/bundle/`.

# 5.Zsh
1. *zprofile*:export environment variables and source zshrc file.
2. *zshrc*:define theme, aliases, functions 
Manage configurations of zsh/vim/tmux/git/aliases
