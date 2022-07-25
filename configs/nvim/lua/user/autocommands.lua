vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

    augroup _setCustomFiletypes
      autocmd!
      autocmd FileType zsh set filetype=sh
      autocmd FileType vimwiki set filetype=markdown
      autocmd FileType qss set filetype=css
    augroup end

  " This autocmd is for CMake util. It changes CWD to be near currently editing tab.
    function! OnTabEnter(path)
      if isdirectory(a:path)
        let dirname = a:path
      else
        let dirname = fnamemodify(a:path, ":h")
      endif
      execute "tcd ". dirname
    endfunction()

    autocmd TabNewEntered * call OnTabEnter(expand("<amatch>"))
]])
