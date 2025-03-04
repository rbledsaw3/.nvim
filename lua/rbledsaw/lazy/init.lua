return {
    {
        "nuvic/flexoki-nvim",
        name = "flexoki",
        config = function()
            require("flexoki").setup({
                variant = "moon",
                styles = {
                    bold = true,
                    italic = false,
                },
                palette = {
                    moon = {
                        base = '#000000',
                    }
                }
            })
        end
    },
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
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }

}
