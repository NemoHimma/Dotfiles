# Abstract
1. Dotbot is merely a bootstrapper for dotfiles.
2. brew manages all the formulaes and casks for macOS system like asdf or vim program, and iterm2 application.


# Homebrew
1. `macos/setup-homebrew.sh` is a script to install brew and essential packages.
2. `zsh/zshenv.zsh` configure brew in zsh shell and choose use vim editor installed by brew rather than system built-in one.
> built-in vim on macOS doesn't support python3, so it leads to a problem when try to use powerline inside vim.

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

# Zsh

