# 0.Dependency
1. Linux system requires system packages like `git curl wget zsh`. Perform following command.

```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev
```

2. Install [asdf](https://github.com/asdf-vm/asdf) to manage multiple languages. Here, python 3.7.4 as a asdf-plugin is required for installing [powerline](https://github.com/powerline/powerline) which displays status in many applications like vim.

# 1.Dotbot
Using [Dotbot](https://github.com/anishathalye/dotbot) to manage dotfiles.Here is a quick [tutorial](https://www.elliotdenolf.com/posts/bootstrap-your-dotfiles-with-dotbot) about how to use Dotbot to download your dotfiles on a new machine.
1. Basically, make a directory named Dotfiles on a new machine, init a git repo, clone dotbot repo as submodule, copy the install script in "dotbot/tools/git-submodule/install", and then touch a config file named "install.config.yaml".
2. Then config the yaml file about where you place the dotfiles and select which dotfiles you used on that new machine.The key is to config `install.conf.yaml`.
3. Set the dotfiles like zshrc, vimrc, tmux.conf, gitconfig or aliases and so on.Then, run the install script. 

```
mkdir Dotfiles && cd Dotfiles
git init
git submodule add https://github.com/anishathalye/dotbot
cp dotbot/tools/git-submodule/install .
touch install.conf.yaml
```

Install a dotbot plugin named [dotbot-asdf](https://github.com/sobolevn/dotbot-asdf.git) to use asdf to install python and then  modify the install script as required.This plugin help to manage multiple programming lanaguage's dependecies and versions as a whole.

```
mkdir dotbot-plugins && cd dotbot-plugins
git submodule add https://github.com/sobolevn/dotbot-asdf.git
echo '"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" --plugin-dir dotbot-plugins/dotbot-asfd -c "${CONFIG}" "${@}"' >> ../install
```

# 2.Install.conf.yaml
Go through the install.conf.yaml file. 
1. Then configure vim editor and its plugins. 
2. Next configure zsh shell by using oh-my-zsh setup and zshrc file, then turn to zgenom to manage its plugins.
3. Configure tmux through tmux.conf file.


# 3.Scripts
I copy the gstate function in scripts from [here](https://github.com/denolfe/dotfiles/blob/master/scripts/gstate) for the beginning to organize my dotfiles.So I can add some extra scripts in the future. 

# 4.Vim 
1. Use vimrc file to customize vim editor where I copy the configuration file from [here](https://github.com/anishathalye/dotfiles/blob/master/vimrc) to start with.
2. vim plugins is managed by built-in mananger, so just add the plugin submodule you need in vim/pack/vendor/start.To start with, I add [ctrlp](https://github.com/ctrlpvim/ctrlp.vim.git) vim plugin through `git submodule add https://github.com/ctrlpvim/ctrlp.vim.git` under the folder of `/vim/pack/vendor/start/`.
3. Setup vim [solarized theme](https://github.com/altercation/vim-colors-solarized) through `git submodule add https://github.com/altercation/vim-colors-solarized.git` under the folder of `vim/pack/vendor/start/`.
4. Setup powerline status for vim using pip install.

```
#Comannd Line
pip3 install powerline-status
vimpwl=$(pip3 show powerline-status | grep 'Location' | sed 's/Location: //)'
vimloc="/powerline/bindings/vim"

#set powerline dir in .vimrc
set rtp+=${vimpwl}${vimloc}
```

If there is a problem about system powerline fonts, run following command to install:
```
sudo apt-get install fonts-powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/
fc-cache -vf /usr/share/fonts/

# If something still goes wrong, it's probaly related to locales
locale -a # check
sudo apt install locales
sudo vim /etc/locale.gen
sudo locale-gen
export LANG='en_US.uft-8'
```

# 5.Zsh
1. [zgenom](https://github.com/jandamm/zgenom) is a zsh plugin manager, help us to easily set up zsh-configuration. For instance, load [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master) configuration framework, add other plugins.In order to use it, apply `source "${HOME}/.zgenom/zgenom.zsh"` on the top of zshrc file to enable zgenom.
2. We can look up useful [built-in plugins](https://github.com/unixorn/awesome-zsh-plugins), [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes), [cheetsheet](https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet) and [FAQ](https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#how-do-i-reload-the-zshrc-file) for resolving oh-my-zsh issues when encountered. If you want speed increase, [Prezto](https://github.com/sorin-ionescu/prezto) is another alternative framework for zsh.
3. **zshrc**: source zgenom, use zgenom to install zsh plugins and themes, configure the setting and options.More Details see [denolfe/dotfiles/zsh](https://github.com/denolfe/dotfiles).
4. [powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) is a fantastic theme for zsh, and it's installed by zgenom as a zsh-plugin. If you have any display problem, just run `p10k configure` to generate a `.p10k.zsh` configuration file for your system.


# Summary
-  Use **Dotbot** to manage Dotfiles, **asdf** as Dotbot-plugin to manage multiple programming languages, **install.conf.yaml** to organize syslinks between configuration files and Dotfiles repo.
- **Scripts** are some useful function written by bash built-in commands without the support of advanced commands or any other functions.
- **Vim** includes configuration about vimrc file, vim-plugin, vim built-in plugin manager and vim-theme.
- **Zsh** is more complicated.First, zsh-plugins and theme are managed by zgenom, it basically set up tool sensitive aliases, code complition, prompts and highlighting.Second, configure shell habit and behaviors about zsh.Third, setup some environment variables that is required by other applications like MuJoCo, which we can organize them under `~/.secrets` folder.Fourth, Some advanced functions or aliases that based on scripts and zsh-commands.

Manage configurations of zsh/vim/tmux/git/aliases
