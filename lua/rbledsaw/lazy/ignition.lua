return {
    "TheThoughtagen/ignition-nvim",
    opts = {
        lsp = {
            enabled = true,
            auto_start = true,
            settings = {
                ignition = {
                    version = "8.1",
                },
            },
        },
        kindling = {
            enabled = true,
        },
        decoder = {
            auto_decode = true,
            auto_encode = true,
        },
    },
}
