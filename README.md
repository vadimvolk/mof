# Master of Folders (mof)

A [Fish] plugin for navigation between folders. Folder saved as a simple bookmarks or including it's subfolders with limited depth. Requires [fzf] installed in your system. Makes easy to add remove and navigate between all saved folders using single key or console command.

## 📦 Installation

Install this plugin with [Fisher][fisher]:
```fish
fisher install vadimvolk/mof
```

Recommend to add in your config.fish:

```fish
alias d 'mof delete'
alias g 'mof goto'
alias s 'mof save'
alias l 'mof list'
alias sc 'mof save-current'
```

If you like to use single keypress to access to all your folders you can also add.
```fish
bind --mode default \a 'mof goto'
```

## 💪 Usage

Installs a single command to contol list of folders and navigate, `mof`.
<script async id="asciicast-569727" src="https://asciinema.org/a/569727.js"></script>

### 📂 Managing list of folders

```fish
~ $ sc
~ $ l
<username>:/Users/<username>
```
Save current folder as a bookmark. Bookmark name is a folder basename by default. Later about how to add it with custom name.

```fish
~ $ s ~/Downloads
~ $ l
<username>:/Users/<username>
Downloads:/Users/<username>/Downloads
```
Save a specific (not curent) folder.

```fish
~ $ s ~/Documents 1
~ $ l
<username>:/Users/<username>
Downloads:/Users/<username>/Downloads
Documents:/Users/<username>/Documents depth=1
```
Save folder and all it's direct subfolders. You can specify any depth you need.

```fish 
~ $ s ~/.config 2 configs
~ $ l
~ $ l
<username>:/Users/<username>
Downloads:/Users/<username>/Downloads
Documents:/Users/<username>/Documents depth=1
configs:/Users/<username>/.config depth=2
```
Save folder with custom name.
 
### 🚀 Navigation
If you installed a binding to a key, you can use it to navigate. Default it's ^ + g or any other key you installed

```fish
g Downloads
```
Since downloads saved with depth 0, you can go there directly.

```fish
g Documents
```
Open selection of subfolders of Documents, since saved with depth 1.

```fish
g configs
```
Open selection of most of config folders (if depth 2 is not enough you can increase it).

# 🙏 Credits

Inspired with great [bookmarks.fish] extension after I tired to add a bookmark for each new project. Currently mof missing an important feature from there: ["Fish shell parameter extension"](https://github.com/gregorias/bookmarks.fish?tab=readme-ov-file#fish-shell-parameter-expansion) going to add it later. Also [bookmarks.fish] is more permissive regarding bookmark names. Going to fix it later also.


[Fish]: https://fishshell.com/
[fisher]: https://github.com/jorgebucaran/fisher
[bookmarks.fish]: https://github.com/gregorias/bookmarks.fish
[fzf]: https://github.com/junegunn/fzf