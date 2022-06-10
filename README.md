# Dotfiles
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

# install.conf.yaml
1. Some useful functions written in scripts directory is syslinked in `~/bin`.
2. Then configure vim editor and its plugins, which is placed in vim/vimrc and vim/vim-plug/plug.vim seperately.
3. Next configure zsh shell by using oh-my-zsh setup and zshrc file, then turn to zgenom to manage its plugins.
4. Configure tmux through tmux.conf file.

Manage configurations of zsh/vim/tmux/git/aliases
