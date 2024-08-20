vim.cmd[[let mapleader=" "]]

vim.cmd[[set nocompatible]]				-- disable compatibility with old-time vi
vim.cmd[[set nu]]						-- set number
vim.cmd[[set mouse=a]]					-- enable mouse click
vim.cmd[[set tabstop=4]]				-- number of colums occupied by a tab
vim.cmd[[set wildmode=longest, list]]	-- get bash-like completions
vim.cmd[[syntax on]]					-- syntax highlighting
vim.cmd[[set autoindent]]				-- indent a new line the same amount as the line just typed
vim.cmd[[set noexpandtab]]
vim.cmd[[set shiftwidth=4]]				-- width for autoindent
vim.cmd[[set tabstop=4]]				-- tabstop 
vim.cmd[[set hlsearch]]					-- highlight search
vim.cmd[[set incsearch]]				-- incremental search
vim.cmd[[set clipboard+=unnamedplus]]	-- use system clipboard

vim.cmd[[set undofile]]
vim.cmd[[set undolevels=1000]]
-- vim.cmd[[set undodir=Your/Data/Dir]]
