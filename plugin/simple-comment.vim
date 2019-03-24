" Written by Emmanuel Branlard - October 2012
" Uses the idea of a plugin named simple_comment, where commet_leader is
" defined for each language
" 
" Updates: May 2013: improved indent in Boxed comment
" 
" --------------------------------------------------------------------------------}
" --- Definition of comment character
" --------------------------------------------------------------------------------{
let b:comment_leader ='#' 
autocmd FileType *                       let b:comment_leader ='#' 
autocmd FileType c,cpp,cs,java,scala,php let b:comment_leader = '//'
autocmd FileType pascal,delphi,js        let b:comment_leader = '//'
autocmd FileType dosbatch                let b:comment_leader = '::'
autocmd FileType autohotkey              let b:comment_leader = ';;'
autocmd FileType sh,ruby,python,perl     let b:comment_leader = '#'
autocmd FileType conf,fstab,gtkrc,yaml   let b:comment_leader = '#'
autocmd FileType gitconfig               let b:comment_leader = '#'
autocmd FileType make,cmake,apache       let b:comment_leader = '#'
autocmd FileType text                    let b:comment_leader = '#'
autocmd FileType fortran                 let b:comment_leader = '!'
autocmd FileType tex,matlab,bib          let b:comment_leader = '%'
autocmd FileType mail                    let b:comment_leader = '>'
autocmd FileType vim                     let b:comment_leader = '"'
autocmd FileType markdown                let b:comment_leader = '<---'
autocmd FileType htc                     let b:comment_leader = ';'
autocmd FileType oin                     let b:comment_leader = '!'
autocmd FileType fast                    let b:comment_leader = '!'


" --- Possibility to change the comment leader used in the "middle" of a boxed
autocmd FileType *             let b:comment_leader_box ='' 
autocmd FileType matlab        let b:comment_leader_box = '%'

" --- Possibility to insert FoldingMarkers
" let b:comment_box_open  ='}' 
" let b:comment_box_close ='{' 

" --------------------------------------------------------------------------------}
" --- Definition of functions
" --------------------------------------------------------------------------------{
function! Comment()
    exe "s@^@".b:comment_leader." @"
endfun
function! UnComment()
    exe "s@^[\ ]*".b:comment_leader." @@e"
endfun
function! ToggleComment()
    let c=b:comment_leader
    exe "s@^@".c." @ | s@^".c." ".c." @@e"
    "     exe "s@^@".c."@"
endfun
" Insert a line below the cursor filled with "-", just like below
" ---------------------------------------------------------------------------
function! InsertLineComment()
    exe "normal o".b:comment_leader." --------------------------------------------------------------------------------"
"     normal ==
endfun

" Insert a "mid comment"
" ---
function! InsertMidComment()
    exe "normal o".b:comment_leader." ---  "
    startinsert
endfun

" --------------------------------------------------------------------------------}
" --- Create box like this one, below the cursor, and ready to insert the title
" --------------------------------------------------------------------------------{
" TODO, } and { as a variable
"normal 75A-
fun! InsertBoxedComment()
    let c=b:comment_leader
    let cb=b:comment_leader_box
    exe "normal o".c." --------------------------------------------------------------------------------}"
    exe "normal o".c.cb.' ---  '
    exe "normal o".c." --------------------------------------------------------------------------------{"
    "normal jVkk=j$
    normal 0k$
    startinsert
endfun
fun! WrapComment()
    let c=b:comment_leader
    let cb=b:comment_leader_box
    exe "normal O".c." --------------------------------------------------------------------------------}"
    normal ^j
    call UnComment()
    exe "normal i".c.cb.' --- '
    exe "normal o".c." --------------------------------------------------------------------------------{"
    normal ^k6l
endfun

map <silent> ,ct :call ToggleComment()<CR>
map <silent> ,cc :call Comment()<CR>
map <silent> ,cu :call UnComment()<CR>
map <silent> ,cb :call InsertBoxedComment() <cr>
map <silent> ,cl :call InsertLineComment() <cr>
map <silent> ,ci :call InsertMidComment() <cr>
map <silent> ,cw :call WrapComment() <cr>

