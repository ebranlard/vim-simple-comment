" Written by Emmanuel Branlard - October 2012
" Uses the idea of a plugin named simple_comment, where commet_leader is
" defined for each language
" 
" Updates: May 2013: improved indent in Boxed comment
" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Definition of comment character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:comment_leader ='#' 
autocmd FileType c,cpp,java,scala,php    let b:comment_leader = '//'
autocmd FileType sh,ruby,python,perl,bib let b:comment_leader = '#'
autocmd FileType conf,fstab,gtkrc        let b:comment_leader = '#'
autocmd FileType gitconfig               let b:comment_leader = '#'
autocmd FileType make,apache             let b:comment_leader = '#'
autocmd FileType fortran                 let b:comment_leader = '!'
autocmd FileType tex,matlab              let b:comment_leader = '%'
autocmd FileType mail                    let b:comment_leader = '>'
autocmd FileType vim                     let b:comment_leader = '"'
autocmd FileType markdown                let b:comment_leader = '<---'
autocmd FileType htc                     let b:comment_leader = ';'
autocmd FileType oin                     let b:comment_leader = '!'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Definition of functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Comment()
    let c=b:comment_leader
    exe "s@^@".c." @"
endfun
" kdjfksj
function! UnComment()
    let c=b:comment_leader
    exe "s@^[\ ]*".c." @@e"
endfun
function! ToggleComment()
    let c=b:comment_leader
    exe "s@^@".c." @ | s@^".c." ".c." @@e"
    "     exe "s@^@".c."@"
endfun
" Insert a line below the cursor filled with "-", just like below
" --------------------------------------------------------------------------------
function! LineComment()
    let c=b:comment_leader
    normal o
    exe "normal 0i".c." "
    normal 80A-
    normal ==
endfun
" --------------------------------------------------------------------------------
" --- Create box like this one, below the cursor, and ready to insert the title
" --------------------------------------------------------------------------------
fun! BoxedComment()
    let c=b:comment_leader
    normal o
    exe "normal 0i".c." "
    normal 80A-
    normal o
    exe "normal 0i".c." "
    normal 80A-
    exe "normal ko".c.' ---  '
    normal jVkk=j$
    startinsert
endfun


" --------------------------------------------------------------------------------
" --- Mappings 
" --------------------------------------------------------------------------------
map <silent> ,ct :call ToggleComment()<CR>
map <silent> ,cc :call Comment()<CR>
map <silent> ,cu :call UnComment()<CR>
map <silent> ,cb :call BoxedComment() <cr>
map <silent> ,cl :call LineComment() <cr>
"map ,co O#<Esc>90A=<Esc>90\|D<CR>i#<CR><Esc>i##<Esc>90a=<Esc>90\|D<Esc>kA

