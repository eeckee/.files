-- Settings

-- new option settings: https://github.com/neovim/neovim/pull/13479
vim.opt.expandtab=true
vim.opt.fileignorecase=true
vim.opt.foldlevelstart=99  -- 0: all fold, 99: no fold
vim.opt.foldmethod='indent'
vim.opt.gdefault=true
vim.opt.hidden=true
vim.opt.ignorecase=true
vim.opt.inccommand='nosplit'     -- show incremental changes for |:substitute|, |:smagic|, |:snomagic|. |hl-Substitute|
vim.opt.mouse='a'           -- mouse functionality (default: empty)
vim.opt.pb=20             -- transparency for popup, (default: 0)
vim.opt.scrolloff=3       -- visual rows above and below cursor
vim.opt.shiftwidth=2
vim.opt.showmode=false        -- no extra --Insert--, --Replace-- etc
vim.opt.sidescrolloff=5   -- visual columns on sides of cursor
vim.opt.signcolumn='yes'
vim.opt.smartcase=true
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.tabstop=2
vim.opt.termguicolors=true     -- Enable true color support.
vim.opt.timeoutlen=300
vim.opt.undofile=true       -- Undo: keep undo persistent over buffer quits
vim.opt.virtualedit='block'      -- onemore 'block' makes it possible to edit empty space in visualblock set cursorline
vim.opt.wrap=false
vim.opt.wrap=false
vim.opt.number=false -- set numbered lines
vim.opt.relativenumber=false -- set relative number
vim.opt.shortmess:append('m') -- Shortmess: help 'shortmess'. Vim default "filnxtToOF"
vim.opt.shortmess:append('x')
vim.opt.shortmess:append('c')
vim.go.t_Co="256"     -- support 256 color

-- 'Sync' files between instances and ignore swap
-- https://youtu.be/fm33-Pas7vI?t=193
-- autocmd on focus, checktime, autoread
-- vim.cmd('set shortmess+=A')   -- ignoire annoying swapfile messages.
vim.opt.shortmess:append('A')
vim.o.autoread=true
vim.cmd([[au FocusGained * silent! checktime]])

-- Automatically resize when vim changes
vim.cmd([[au VimResized * exe "normal! \<c-w>="]])

-- Highlight text when yank. Built in lua.
vim.cmd([[au! TextYankPost * silent! lua vim.highlight.on_yank {higroup="DiffAdd", timeout=500}]])

-- Remember line on exit/start
vim.cmd([[ au! BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif ]])
