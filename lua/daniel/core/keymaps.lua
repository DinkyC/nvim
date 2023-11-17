vim.g.mapleader = " "

local keymap = vim.keymap
---------------------
-- General Keymaps
---------------------
-- run browser sync 
keymap.set("n", "<leader>bs", ":!browser-sync start --server --files '*.js, *.html, *.css'<CR>")
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clang-format
keymap.set("n", "<leader>f", ":!clang-format -i %<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Compile
keymap.set("n", "<leader>cc", ":!g++ -g -Wall -Wextra -Werror -Wshadow -pedantic -Wconversion -Wfloat-equal -Wsign-compare -std=c++20 -O0 -o %< %<CR>")

-- Run 
keymap.set("n", "<leader>r", ":!./%< <CR>")

-- cppman
keymap.set("n", "<leader>k", ":JbzCppMan")

-- Markdown Preview
keymap.set("n", "<leader>p", ":MarkdownPreview<CR>")

-- Terminal 
keymap.set("n", "<leader>t", ":terminal<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization


-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

vim.cmd([[
 function! s:JbzCppMan()
     let old_isk = &iskeyword
     setl iskeyword+=:
     let str = expand("<cword>")
     let &l:iskeyword = old_isk
     try
         execute 'Man ' . str
     catch
        " If Man fails, try cppman
         execute '!cppman ' . str
     endtry
 endfunction
 command! JbzCppMan :call s:JbzCppMan()
 ]])


-- Define the Vimspector command
vim.cmd("command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)")

-- Define the Vimspector key mappings
local keymap_options = { noremap=true, silent=true }

-- adjust config

keymap.set('n', '<leader>gd', ':call vimspector#Launch()<CR> :AdjustVimspectorConfig<CR>', keymap_options)
keymap.set('n', '<leader>gc', ':call vimspector#Continue()<CR>', keymap_options)
keymap.set('n', '<leader>gs', ':call vimspector#Stop()<CR>', keymap_options)
keymap.set('n', '<leader>gR', ':call vimspector#Restart()<CR>', keymap_options)
keymap.set('n', '<leader>gp', ':call vimspector#Pause()<CR>', keymap_options)
keymap.set('n', '<leader>gb', ':call vimspector#ToggleBreakpoint()<CR>', keymap_options)
keymap.set('n', '<leader>gB', ':call vimspector#ToggleConditionalBreakpoint()<CR>', keymap_options)
keymap.set('n', '<leader>gn', ':call vimspector#StepOver()<CR>', keymap_options)
keymap.set('n', '<leader>gi', ':call vimspector#StepInto()<CR>', keymap_options)
keymap.set('n', '<leader>go', ':call vimspector#StepOut()<CR>', keymap_options)
keymap.set('n', '<leader>gr', ':call vimspector#RunToCursor()<CR>', keymap_options)
keymap.set('n', '<leader>gq', ':call vimspector#Stop()<CR>:VimspectorReset<CR>')
