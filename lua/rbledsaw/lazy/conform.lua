return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                elixir = { "mix" },
                cpp = { "clang-format" },
                c = { "clang-format" },
                python = { "black" },
                rust = { "rustfmt" },
                json = { "jq" },
                yaml = { "yamlfmt" },
                markdown = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                bash = { "shfmt" },
                shell = { "shfmt" },
                sql = { "sqlformat" },
                xml = { "xmllint" },
                toml = { "taplo" },
                dockerfile = { "dockerfilelint" },
            }
        })
    end
}
