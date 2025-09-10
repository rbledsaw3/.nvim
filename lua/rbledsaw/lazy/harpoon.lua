return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local ok, harpoon = pcall(require, "harpoon")
        if not ok then return end
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        vim.keymap.set("n", "<leader>a", function() harpoon:add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", "<C-h>", function() harpoon:select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon:select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:select(3) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:select(4) end)
    end
}
