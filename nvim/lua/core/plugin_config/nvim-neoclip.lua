require('neoclip').setup()
require('telescope').load_extension('neoclip')

vim.keymap.set("n",  "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip"})
