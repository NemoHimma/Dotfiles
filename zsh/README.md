# Goal
1. When you type `echo $PATH`, you will find out command is searched first by version manager asdf, then package manager brew, and scripts in `~/bin`.Finally, turn to system packages for help.
2. zsh startup files is executed in the following order `zshenv`---`zprofile`---`zshrc`---`zlogin`---`zlogout` 

> Ideal $PATH=/Users/user_name/.asdf/shims:/opt/homebrew/opt/asdf/libexec/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/user_name/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Startup Files
1. `.zshenv` usually setup some global environment variables for system damon in a non-login non-interactive way like $EDITOR, $INFOPATH, $MANPATH. However, if you carefully manage all the environment variables inside every shell script for portability, there's no need for zshenv file except for private info like password, gpg key.
2. `.zprofile` would set the environment variable when you first login. That is to say, when you start a terminal, it will automatically open a login and interactive shell for you.On macOS, type `zsh` inside a terminal session, it will start a non-login but interactive shell, which means `.zprofile` is not run. 
> if `.zprofile` is missing, /etc/zprofile would be run. It will set system path like `/usr/bin` ahead, confusing the package you are using. For example, if `/usr/bin` is ahead of `/opt/homebrew/bin`, when you type `vim`, you are using system vim without python3 support instead of vim installed by brew. 
3. `.zshrc` is run in every interactive shell. It's worth knowing that if you run `zsh` in an already opened terminal, it would duplicate some of the paths like `/Users/nemozhang/.asdf/shims:/opt/homebrew/opt/asdf/libexec/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/nemozhang/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin`. Brew paths are duplicate because they are setup in `zshrc` file. 
4. Missing `.zlogout`. In short, this is used to remove the private information. This should be managed in a private repo.

# Basic Setup
1. Which shell you are using
```
cat /etc/shells
echo "$(brew --prefix zsh)" >> /etc/shells
chsh -s "$(brew --prefix zsh)""
```
2. Make shell aware of brew command and [zgenom](https://github.com/jandamm/zgenom#Usage)
```
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zgenom/zgenom.zsh
```
> For ohmyzsh and pretzo compatiable plugin, it will automatically clone the plugin.zsh
- `zgenom update`: manually check for updates for plugin
- `zgenom reset`: reset the init script whenever you add or remove plugins
- `zgenom autoupdate`: checks for updates periodically.
- `zgenom save`: Generate init.zsh

3. Basic Zsh-Plugins and usage.
[ohmyzsh-plugin-list](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins) is here.
- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh): framework
- [ohmyzsh-git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git):The git plugin provides many aliases and a few useful functions.
- [ohmyzsh-tmux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux):aliases for tmux
- [ohmyzsh-docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker):auto-completion and aliases for docker
- [ohmyzsh-command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found):provide suggested packages to be installed if a command cannot be found
- [ohmyzsh-autojump](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/autojump):autojump navigation tool.
> `j, jc, jo, jco` jump directly to specified dir.Type `autojump --help` or `man autojump` for help.
- [ohmyzsh-fzf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf):enables its fuzzy auto-completion and key bindings.
> `^R` for fuzzy search history, ^T for files searching
- [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions):As you type commands, you will see a completion offered after the cursor in a muted gray color.
- [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): syntax highlighting
- [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search): history search
- [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions): completion scripts
- [djui/alias-tips](https://github.com/djui/alias-tips): help remembering those shell aliases and Git aliases you once defined
- [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k): type `p10k configure` to install Nerd Font, and setup prompt.

> Normally, zgenom would help setup zsh shell to know their command. Further, corresponding customization can be added at the end of zshrc file.
> Concept of Plugin! Autojump plugin requires brew install autojump to provide the command.

# Advanced Issue
1. zgenom will download zsh plugin into `sources` folder, then generate `init.zsh` for exporting and sourcing them.
2. If something doesn't work after adding `zgenom load repo/plugin-name <location> <branch>` in zshrc file, you can manully configure them in zshrc file or git clone corresponding repo under sources, ensuring `init.zsh` contain this plugin path. For example:
```
###### Add one line in zshrc file using zgenom
zgenom load djui/alias-tips
# then in ~/.zgenom/sources you can see this folder.
# If there is a problem, you can clone git repo under ~/.zgenom/sources/alias-tips/____/*
######  Or add all of this in zshrc file manually
git clone https://github.com/djui/alias-tips.git
source alias-tips/alias-tips.plugin.zsh
# Manual operation can replaced as 'git submodule add' to simply.
```

# Resources to improve
- [zsh-quickstart-kit](https://github.com/unixorn/zsh-quickstart-kit)
- [denolfe-dotfiles](https://github.com/denolfe/dotfiles/)
