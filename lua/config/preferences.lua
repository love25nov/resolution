--[[--------------------------- resolution v0.1.0 ------------------------------

resolution is a Neovim config for writing TeX and doing computational math.

Assorted options (other than colorscheme/mode/keybinds) including Vim options.

Copyright (C) 2023 Roshan Truax

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) at any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

------------------------------------------------------------------------------]]

local prefs = {}

-------------------------------- redefinitions ---------------------------------

local opt = vim.opt
local glb = vim.g
local cfg = vim.fn.stdpath('config')

------------------------------ necessary settings ------------------------------

-- where projects are stored
prefs.project_root_path = '/home/roshan/Documents/Mathematics'

------------------------------- other locations --------------------------------

-- style file for formatting LaTeX
prefs.format_style_file = cfg .. '/tex/format-style.yaml'
-- dictionary files
prefs.dictionary_files = {
    cfg .. '/tex/dictionary/dictionary.txt'
}


----------------------------- vimtex configuration -----------------------------

-- where to look for PDF viewer
glb.vimtex_view_sioyek_exe         = '/home/candice/usr/bin/sioyek'
-- type of PDF viewer
glb.vimtex_view_method             = 'sioyek'
-- warnings to ignore
glb.vimtex_quickfix_ignore_filters = {
    'Underfull',
    'Overfull',
    'requested',
    "removing `math shift'",
    'bad break',
    'atopwithdelims',
    'has changed',
    'Package hyperref Warning',
    'Font shape',
    'Warning: Token not allowed',
}

--------------------------------- leader keys ----------------------------------

vim.g.mapleader      = ' '  -- set leader key
vim.g.maplocalleader = '\\' -- local leader key

------------------------------- visual elements --------------------------------

opt.cursorline     = true  -- cursor line highlighting
opt.number         = true  -- line numbering
opt.relativenumber = true  -- relative line numbering
opt.wrap           = true  -- soft line wrapping
opt.linebreak      = true  -- no line breaks in the middle of words
opt.list           = false -- no line breaks in middle of word

opt.scrolloff      = 5     -- # of guaranteed lines at top & bottom
opt.pumheight      = 5     -- maximum size of pop-up menu
opt.cmdheight      = 0     -- height of command line prompt
opt.showmode       = false -- show INSERT MODE message in command line
opt.updatetime     = 1000  -- time before keybind menu opens

--------------------------- snippets and completion ----------------------------

prefs.autosnippets      = true  -- default behavior of auto-expanding snippets
prefs.automath_snippets = true  -- default behavior of auto-mathing snippets
prefs.autocomplete      = true  -- default behavior of autocompletion
opt.spell               = false -- spell checker

----------------------------- tabs and indentation -----------------------------

opt.expandtab   = true -- expand tabs into spaces
opt.tabstop     = 4    -- width of tab character
opt.softtabstop = 4    -- # of spaces per tab keypress
opt.shiftwidth  = 4    -- # of spaces per indent
opt.autoindent  = true -- enable autoindentation

------------------------------- search settings --------------------------------

opt.hlsearch   = true -- highlight search results
opt.incsearch  = true -- incremental searching
opt.ignorecase = true -- searching is not case-sensitive
opt.smartcase  = true -- searching is smartly case-sensitive

----------------------- undo/backups/swapfiles/sessions ------------------------

opt.undodir               = cfg .. '/utilities/undo//'     -- undo directory
opt.backupdir             = cfg .. '/utilities/backup//'   -- backup directory
opt.directory             = cfg .. '/utilities/swap//'     -- swap file directory
glb.auto_session_root_dir = cfg .. '/utilities/sessions//' -- session directory

opt.undolevels = 1000  -- max number of undos
opt.undofile   = true  -- enable permanent undo file
opt.backup     = true  -- enable backups
opt.swapfile   = false -- enable swapfiles
opt.autoread   = true  -- automatically reread buffers

-------------------------------- miscellaneous ---------------------------------

-- don't edit these unless you're at least an intermediate user
prefs.number_recent_files = 5             -- number of recent files in startup screen
prefs.timestamp_backup    = true          -- timestamped backups (leave this ON in alpha)
prefs.autosave            = true          -- automatically compile LaTeX files
opt.termguicolors         = true          -- better colors, no reason to change this in 2023
opt.clipboard             = 'unnamedplus' -- unify system & vim clipboard
opt.foldmethod            = 'marker'      -- folding using triple curly brackets
opt.fillchars             = { eob = ' ' } -- remove end-of-file characters
opt.ea                    = false         -- let rsltn handle window resizing
opt.autochdir             = true          -- let vim automatically follow the buffer in directory
vim.cmd('autocmd VimLeave * set guicursor=a:ver25-Cursor-blinkwait700-blinkon400-blinkoff250')

--------------------------------------------------------------------------------

return prefs

--------------------------------------------------------------------------------
