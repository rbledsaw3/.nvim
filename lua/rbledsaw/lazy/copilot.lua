return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        build = ":Copilot auth",
        config = function()
            local cwd = (vim.loop and vim.loop.cwd and vim.loop.cwd()) or vim.fn.getcwd()
            if not (cwd and vim.loop.fs_stat(cwd)) then
                vim.cmd.cd(vim.fn.expand("~"))
            end
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    hide_during_completion = false,
                    debounce = 25,
                    keymap = {
                        accept = false,
                        accept_word = false,
                        accept_line = "<Tab>",
                        next = false,
                        prev = false,
                        dismiss = false,
                    },
                },
                panel = { enabled = false },
            })
        end,
    },
}
