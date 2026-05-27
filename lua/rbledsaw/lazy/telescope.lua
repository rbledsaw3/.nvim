return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "plenary",
        "nullromo/telescope-box-drawing.nvim"
    },
    config = function()
        require('telescope').setup({
            extensions = {
                ["box-drawing"] = {}
            }
        })
        require('telescope').load_extension('box-drawing')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end,
    keys = {
        { "<leader>bd", function() require("telescope").extensions["box-drawing"]["box-drawing"]() end, desc = "Telescope Box Drawing" },
        { "<C-]>", function () require("telescope").extensions["box-drawing"]["box-drawing"]() end, mode = "i", silent = true, desc = "Box Drawing (insert mode)" },
    }
}
