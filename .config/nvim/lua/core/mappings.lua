local map=vim.api.nvim_set_keymap;
local opts={noremap=true};
map('n','<leader>l',':wincmd l<CR>',opts);
map('n','<leader>h',':wincmd h<CR>',opts);
map('n','<leader>j',':wincmd j<CR>',opts);
map('n','<leader>k',':wincmd k<CR>',opts);
map('n','<leader>v',':wincmd v<CR>',opts);
map('n','<leader>=',':vertical resize +5<CR>',opts);
map('n','<leader>-',':vertical resize -5<CR>',opts);

map('n','<leader>e',':NvimTreeToggle<CR>',opts);

map("n", "<c-n>", ":Telescope buffers<CR>",opts)
map("n", "<c-g>", ":Telescope git_files<CR>",opts)
map("n", "<c-p>", ":Telescope find_files<CR>",opts)
-- map("n", m.find_hiddenfiles, ":Telescope find_files hidden=true <CR>")
-- map("n", m.git_commits, ":Telescope git_commits <CR>")
-- map("n", "<c-g>", ":Telescope git_status <CR>",opts)
-- map("n", m.help_tags, ":Telescope help_tags <CR>")
-- map("n", m.live_grep, ":Telescope live_grep <CR>")
-- map("n", m.oldfiles, ":Telescope oldfiles <CR>")
-- map("n", m.themes, ":Telescope themes <CR>")

map('n','<leader>gs',':G<CR>',opts)

map('n',"<leader>/",":CommentToggle<CR>",opts)
map('v',"<leader>/",":CommentToggle<CR>",opts)

map("n", "<tab>", ":BufferLineCycleNext<CR>",opts)
map("n", "<s-tab>", ":BufferLineCyclePrev<CR>",opts)
