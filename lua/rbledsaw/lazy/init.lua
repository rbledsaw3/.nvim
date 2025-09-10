return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "plenary"
        }
    },
    {
        "folke/trouble.nvim",
    },
    {
        "nvim-treesitter/nvim-treesitter",
    },
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "folke/zen-mode.nvim",
    "eandrju/cellular-automaton.nvim",
    "laytan/cloak.nvim",
    "nvim-treesitter/playground",
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "theprimeagen/vim-be-good",
    "sbdchd/neoformat",
    {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons" }
    },
    { "VonHeikemen/lsp_zero.nvim", enabled = false },

}
