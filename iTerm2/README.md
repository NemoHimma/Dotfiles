# 1.Useful Features
## 1.1 Windows, Tabs and Panes.
- **Split Panes**: Bindkey `Cmd + |` and `Cmd + _` to split panes vertically and horizontally with default profile.
- **Navigate Panes**: Bindkey `Option + h/j/k/l` to select specific pane.
- **Navigate Tabs**: Bindkey `Cmd + h/l` to select tab, and `Cmd + <Number>` to jump to the tab.
- **Panes Focus**: `Cmd + Shift + Enter` to enter focus mode on current pane.
- **Window Focus** `Cmd + Enter` to enter window focus mode.

> Window arrangemen can save your current opened windows,tabs and panes so that you can restore it conviently.

## 1.2 Tmux Integration
Here is the [best practice](https://gitlab.com/gnachman/iterm2/-/wikis/tmux-Integration-Best-Practices) of tmux integration.However, since knowing tmux is not a burden to me and i don't have massive servers to work on. Hence, this feature seems confusing native tmux to me.

To escape typing ssh again and again, it's better to ship with command into profile. What you need to do is to open a profile locally, then attach tmux session remotely.


## 1.3 Shell Intergration
Manual Setop as follows or click `iTerm2>Install shell integation`
```
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
source ~/.iterm2_shell_integration.zsh
```

[Basci Features](https://iterm2.com/documentation-shell-integration.html) are listed, where i find most frequently used for me:
- Download with scp on server: right click with filename then select Download.
- Upload with scp to server: drag the file to current sesstion while holding option key.
 


## 1.4 Profile Management
- Profile is a named of collection of settings.It is useful if you often connect to different servers.
- The key feature of profile is that it's shipped with a command to run when you file open a profile. That is to say, you can add a command ssh@example.com into example profile to distinguish the servers you ssh.

> In `Prefences>Profiles>Advanced` specify rules that match sessions to profiles automatically.In addition, rule act like `username@hostname:/dirname`

## 1.5 Other Tips
- `Cmd + Shift + e` show timestamps you modified in current file.

# 2.Configuring iTerm2
- Profile Color: See [Dracula](https://draculatheme.com/iterm).Simply, import dracula.itermcolors in `Preferences>Profiles>Colors>Color Presets`.
- Add iterm2_shell_integration.zsh as a link in `install.conf.yaml`.
- Import keybinding.itermkeymap in `Preferences>Keys>Presets`.





