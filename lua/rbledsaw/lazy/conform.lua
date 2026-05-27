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
                python = function(bufnr)
                    if vim.b[bufnr].enable_black then
                        return { "black" }
                    else
                        return {}
                    end
                end,
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

        vim.keymap.set("n", "<leader>tb", function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.b[bufnr].enable_black = not vim.b[bufnr].enable_black
            if vim.b[bufnr].enable_black then
                vim.notify("Black formatter ENABLED for this buffer", vim.log.levels.INFO)
            else
                vim.notify("Black formatter DISABLED for this buffer", vim.log.levels.INFO)
            end
        end, { desc = "Toggle Black formatter for Python in this buffer" })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                asyc = false,
                timeout_ms = 500,
            })
        end, { desc = "Format buffer" })
    end
}
