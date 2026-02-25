-- Editor behavior
vim.opt.mouse = ""
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = false
vim.opt.expandtab = true

-- Cursor and display
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"

-- Search
vim.opt.ignorecase = false
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- UI
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.foldopen = "mark,percent,search,tag,undo"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Other
vim.o.timeoutlen = 300
