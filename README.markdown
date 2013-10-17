Vim-simple-comment
==============

Simple script to comment your code. It comments the current line or a selection of lines. 
Support uncomment and toggle comment but also some separators: the box comments and the line comments. 
The box comment will insert something like:
```
# --------------------------------------------------------------------------------
# --- TITLE
# --------------------------------------------------------------------------------
```
and the line comment:            
```
# --------------------------------------------------------------------------------
```
The script do no block commenting with a start and end character.



Functionalities
----------------

Below is a list of functionalities. Default mappings are written within parenthesis and functions within brackets. Mappings can be overriden in your vimrc or directly in the plugin file.
- "Comment line or selection"   (,cc) [Comment()]
- "Uncomment line or selection" (,cu) [UnComment()]
- "Toggle Comment"              (,ct) [ToggleComment()]
- "Create a comment box"        (,cb) [BoxedComment()]
- "Create a comment line"       (,cl) [LineComment()]

Installation - Vim
------------------

Copy the file "plugin/simple-comment.vim" into the equivalent location in your Vim config directory, e.g.: ~/.vim/plugin/ 


If you don't have a preferred installation method, I recommend installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and then simply copy and paste:
```bash
    cd ~/.vim/bundle
    git clone git://github.com/elmanuelito/vim-simple-comment.git
```


Languages not supported
-----------------------
I've omitted languages that I haven't used yet. For instance, if you want to add support for php just add the following line to the script:
```vim
autocmd FileType php                    let b:comment_leader = '//'
```


Contributing
------------

Please do, and don't hesitate to contact me.

License
-------

Copyright (c) E. Branlard (lastname at gmail dot com).  Distributed under the same terms as Vim itself.
See `:help license`.
