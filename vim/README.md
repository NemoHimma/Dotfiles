> [Vim wiki](https://vim.fandom.com/wiki/Vim_documentation)
# Movements in Normal Mode
- (Character)`hjkl`: left, down, up, right
- (Word)`w b`: beginning of next word and backward word;`e ge`:end of next word and last word (ge "go to the end of last word")
- (Line)`0 $`: jump to beginning and end of current line
- (File)`gg G`: jump to beginning and end of file

- (Character Find)`fa` or `Fa`: find and jump to next or previous 'a' character; `, ;` for navigating
- (Word Find) `# *`: find and jump to next or previous matched current word;
- (Bracket Find) `%`: jump to next match bracket
- (Search) `/{regex}` and  `n/N` for navigating.

> Add `mouse+=a` in vimrc file to enable mouse mode for selecting and scrolling.

# Selection in Visual Mode
- (Character) `v`
- (Line) `V`
- (Block) `^V`
After selection, peform operations like delete `d`, change `c`, copy(yank) `y` and paste `p`.
# Editing between Nomal Mode and Insert Mode
- (Character Insert)`i a`: insert ahead and append under current character 
- (Line Insert)`I A`: insert ahead and append under current line
- (Line Insert)`o O`: open next line or previous line to insert
- (Change Insert) `cl cw c$ c0`: change{motion}
- (Delete Normal) `x dw d$ d0`: delete{motion} `x` equal to `dl`
- (Undo Redo) `u ^R`
- (Copy Paste Substitute) `y p s`
> Noticably, `ci(` means change inside `(`. `da(` means delete around `(`.`dtc` means delete to right until character `c`.

In Summary, a command is compose of `operations`(d,y,c) + `number`(3) + `description`(l,w,s,p) + `symbol`({,\,/), where l,w,s,p refer to current character, word, sentence, paragrah.

# Command Mode
- (Search and Substitute) `:%s/pattern_to_search/pattern_to_substitute/g` 
> `%` means the whole file, it can be replaced by `.,$` meanning current line to the end of file.
> `s` means search `pattern_to_search`, then `g` means substitute them with `pattern_to_substitute` globally.
- (Multiple Windows) `:sp / :vsp` to open multiple buffers and `^ww` for navigating.
- `^h/j/k/l` to navigate windows, `^W + H/J/K/L` to move windows.
- `:tabedit file` to open file as new tab, `{number} gt` to navigate tabs.

# Vim-plugins
> Simply `git submodule add vim-plugin-url` under `~/.vim/pack/vendor/start/`
- [ctrlp](https://github.com/ctrlpvim/ctrlp.vim): search file to be opened in vim.
> `^p` to invoke
- [vim-markdown](https://github.com/tpope/vim-markdown/tree/b78bbce3371a2eb56c89f618cd4ab2baadc9ee61): syntax highlighting
- [nerd-tree](https://github.com/preservim/nerdtree.git)



