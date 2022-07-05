# Abstract
1. Dotbot is merely a bootstrapper for dotfiles.
2. Brew manages all the formulaes and casks for macOS system like asdf package, vim program or iterm2 application.
3. Zsh configuration files(.zshenv, .zprofile, .zshrc) are used to custom packages, programs and applications in zsh shell. Simply, these files just tell the shel where to find programs, to custom setup application behavior and frequently used packages.


# Homebrew
1. `macos/setup-homebrew.sh` is a script to install brew and essential packages.
> In convience, put `opt/homebrew/bin` and `/opt/homebrew/sbin` ahead of `/usr/bin` in $PATH.
2. `zsh/zshenv.zsh` configure brew in zsh shell and choose use vim editor installed by brew rather than system built-in one.
> built-in vim on macOS ARM doesn't support python3, so it causes a problem when try to use powerline inside vim.

## Basics of brew
- **formula**: Homebrew package definition built from upstream sources
- **cask**: Homebrew package definition that installs macOS native applications
- **keg**: installation destination directory of a given formula version 
- **rack**: directory containing one or more versioned kegs
- **cellar**: directory containing one or more named racks 
- **caskroom**: directory containing one or more named casks
- **external command**: brew subcommand defined outside of the Homebrew/brew GitHub repository
- **tap**: directory(and usually Git repository) of formulae, casks and/or external commands
- **bottle**: pre-built keg poured into the cellar/rack instead of building from upstream sources
> Simply, **formula** is recorded by keg, rack and cellar.Then, **cask** is located in caskroom.

`man brew` to install, uninstall, upgrade, update your formulas and casks.

# Zsh
> Simply, `.zshenv` would be run first, then `.zprofile` for login shell, `.zshrc` for interactive shell.If you don't create these files, `/etc/zprofile` and `/etc/zshrc` would be run.By default, configuration files are run in the order of `.zshenv`---`.zprofile`(login)---`.zshrc`(interactive). It's better to create `.zprofile` to avoid running `/etc/zprofile` that modifies $PATH variable.

Remember that brew install every program, package and application.Now it's time to configure them in zsh.
1. Choose the zsh shell you are using by adding shell path like `/opt/homebrew/bin/zsh` into `/etc/shells`, then `chsh`.
2. *Vim*: export `/opt/homebrew/bin/vim` in `zshenv.zsh` file to choose which vim editor you use. Then link `vim folder` and `vimrc file` to custom vim editor like adding vim-plugin.
3. [asdf](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf): Overall manager for differt type and version of programming languages. It's been set up in zshrc.zsh file by `. /opt/homebrew/opt/asdf/libexec/asdf.sh`. In `install.conf.yaml`, we have used asdf install python 3.7.12.Notice that `fpath` is to cutsom asdf completions in zsh.
> It's worth knowing that python 3.7.12 wouldn't lead to a problem on macOS ARM M1 pro.
4. [zgenom](https://github.com/jandamm/zgenom#Usage): Zsh-plugin manager to use ohmyzsh and its plugins, zsh-users like zsh-autosuggestions and etc. This can simplify zshrc file. By adding `source ~/.zgenom/zgenom.zsh`, it enable zsh shell use zgenom to manage zsh-plugins through generating `init.sh`.
> `init.sh` is located in `~/.zgenom/source/init.sh`, it would export and source all the zsh-plugins with their completions.
5. [powerlevel10k](https://github.com/romkatv/powerlevel10k): By running `p10k configure`, you will custom p10k theme as the way your want.After that, you need to source your p10k customization to overridden original powerlevel10k theme.



# Issue
- Dotfiles work only on macOS ARM because the specification of `/opt/homebrew`. It can be replaced by `$(brew --prefix)` on macOS Intel within zsh configuration file `zshrc.zsh` and `zshenv.zsh`.
- `brew install vim` that support python3 will install python@3.10 dependency, which conflicts with `asdf install python 3.7.12`.These conflicts remain. It involves vim internal working mechanism.
- What is the relation between brew environment and asdf environment? Now we only know that asdf is a formulae of brew, then we use asdf to install python 3.7.12, setting it a global python to refer. So, it might have the same python package in both brew and asdf. How to make brew to refer asdf python package instead of reinstalling the same package?
