syn on
set bg=light
set tabstop=2
set shiftwidth=2
set encoding=utf-8
set number
set et
set ff=unix

set directory=./.swp,~/.swp//,~/.tmp,~/tmp//,/tmp//,.

if has("gui_macvim")
    set cul
    colorscheme desert
    hi Normal guibg=gray10
    hi Cursorline guibg=black
    hi Cursor guibg=gray70 guifg=black
    hi NonText guibg=gray5
    set guifont=Monaco:h14

    if empty($VIM_GUI_FONTSIZE)
        set guifont=Monaco:h14
    else
        set guifont=Monaco:h16
    endif

    let macvim_hig_shift_movement = 1
    vnoremap <Tab> >
    vnoremap <S-Tab> <
    set go+=T
    set laststatus=2
    set statusline=%4l%4c
    set statusline+=\ \ #%-5b#x%-6B%=
    set statusline+=%y
    set statusline+=\ [%{''.(&fenc!=''?&fenc:&enc).''}]
    set statusline+=\ [%L\ lines]
endif

if has("autocmd")
    filetype plugin indent on
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
2match OverLength /\%81v.\+/

highlight TrailingSpace ctermbg=darkgray guibg=darkgreen
match TrailingSpace /\s\+$/

if has("pathogen")
    execute pathogen#infect()
    call pathogen#helptags()
endif
