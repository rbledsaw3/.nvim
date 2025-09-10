function ColorMyPencils(color, opts)
	color = color or "flexoki"
    opts = opts or {}

    if opts.background == "dark" or opts.background == "light" then
        vim.o.background = opts.background
    end

    local ok, err = pcall(vim.cmd, "colorscheme " .. color)
    if not ok then
        vim.notify("Colorscheme " .. color .. " not found: " .. tostring(err), vim.log.levels.ERROR)
        return
    end

    if opts.black_bg then
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
    elseif opts.transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

return {

    {
        "cpplain/flexoki.nvim",
        name = "flexoki",
        lazy = false,
        config = function()
            require("flexoki").setup({
                plugins = {
                    "gitsigns",
                    "nvim_treesitter_context",
                    "which_key",
                }
            })
            ColorMyPencils("flexoki", { background = "dark" , black_bg = true})
            require("lualine").setup({
                options = {
                    theme = "flexoki",
                    },
            })
        end,
    },

    {
        "erikbackman/brightburn.vim",
        name = "brightburn",
    },

    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })
        end,
    },

}
