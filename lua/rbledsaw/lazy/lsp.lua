local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", opts = {}},
        { "folke/neodev.nvim", opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "j-hui/fidget.nvim",
        "stevearc/conform.nvim",
    },

    config = function()
        require("neoconf").setup({
            root_files = root_files,
        })
        require("neodev").setup({})
        require("fidget").setup({})
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        require("mason").setup()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        local lspconfig = require("lspconfig")
        local util = require("lspconfig.util")

        lspconfig.zls.setup({
            capabilities = capabilities,
            root_dir = util.root_pattern(".git", "build.zig", "build.zig.zon", "build.zon", "build.zig.toml", "build.toml", "zig-cache", "zig-out"),
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        })
        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            root_dir = util.root_pattern( root_files ),
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim", "bit", "it", "describe", "before_each", "after_each" },
                    },
                    format = {
                        enable = true,
                        -- Put format options here
                        -- NOTE: the value should be STRING!!
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "4",
                        }
                    },
                    telemetry = {
                        enable = false,
                    },
                }
            }
        })
        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            "tw`([^`]*)",
                            "tw=\"([^\"]*)",
                            "tw={\"([^\"}]*)",
                            "tw\\.\\w+`([^`]*)",
                            "tw\\(.*?\\)`([^`]*)",
                        },
                    },
                },
            },
        })

        lspconfig.rust_analyzer.setup({ capabilities = capabilities })
        lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                },
            },
        })
        lspconfig.bashls.setup({
            capabilities = capabilities,
            filetypes = { "sh", "zsh" },
        })
        lspconfig.dockerls.setup({
            capabilities = capabilities,
            filetypes = { "dockerfile" },
        })
        lspconfig.html.setup({
            capabilities = capabilities,
            filetypes = { "html", "htmldjango" },
            settings = {
                html = {
                    format = {
                        wrapLineLength = 120,
                        unformatted = "a,code,pre,em,strong,span",
                        contentUnformatted = "a,code,pre,em,strong,span",
                        indentInnerHtml = true,
                        preserveNewLines = true,
                        maxPreserveNewLines = 2,
                        indentHandlebars = true,
                        endWithNewline = true,
                        wrapAttributes = "force",
                        wrapAttributesIndentSize = 2,
                        wrapAttributesForceAlignment = true,
                        wrapAttributesForcePosition = "force",
                    },
                },
            },
        })
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            filetypes = { "json", "jsonc" },
            settings = {
                json = {
                    format = {
                        enable = true,
                        -- Put format options here
                        -- NOTE: the value should be STRING!!
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        }
                    },
                },
            },
        })
        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace",
                        autoImportCompletions = true,
                        inlayHints = {
                            functionReturnTypes = true,
                            variableTypes = true,
                            parameterNames = true,
                            variableTypes = true,
                            functionParameterTypes = true,
                            classMemberTypes = true,
                        },
                    },
                },
            },
        })
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "javascript.jsx", "typescript.tsx" },
            root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
            settings = {
                typescript = {
                    format = {
                        enable = true,
                        -- Put format options here
                        -- NOTE: the value should be STRING!!
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        }
                    },
                },
                javascript = {
                    format = {
                        enable = true,
                        -- Put format options here
                        -- NOTE: the value should be STRING!!
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        }
                    },
                },
            },
        })
        lspconfig.yamlls.setup({
            capabilities = capabilities,
            filetypes = { "yaml", "yml" },
            settings = {
                yaml = {
                    format = {
                        enable = true,
                        -- Put format options here
                        -- NOTE: the value should be STRING!!
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                        }
                    },
                    schemas = {
                        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                            "docker-compose.yml",
                            "docker-compose.yaml",
                            "compose.yaml",
                            "compose.yml",
                        },
                        ["https://raw.githubusercontent.com/helm/charts/master/stable/values.schema.json"] = {
                            "Chart.yaml",
                            "values.yaml",
                            "values.schema.json",
                        },
                        ["https://raw.githubusercontent.com/ansible-community/schemas/main/ansible.schema.json"] = {
                            "ansible.cfg",
                            "ansible.json",
                            "ansible.yaml",
                            "ansible.yml",
                        },
                        ["https://raw.githubusercontent.com/GoogleContainerTools/kpt/master/schemas/kptfile.schema.json"] = {
                            "Kptfile",
                        },
                        ["https://raw.githubusercontent.com/GoogleContainerTools/kustomize/master/examples/overlays/overlays.schema.json"] = {
                            "kustomization.yaml",
                            "kustomization.yml",
                        },
                        ["https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-config-connector/master/schemas/cck.schema.json"] = {
                            "config-connector.yaml",
                            "config-connector.yml",
                        },
                    },
                    validate = true,
                    hover = true,
                    completion = true,
                    schemaStore = {
                        enable = true,
                        url = "https://www.schemastore.org/api/json/catalog.json",
                    },
                },
            },
        })
        lspconfig.clangd.setup({
            capabilities = capabilities,
            filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp", "cxx", "cc" },
            root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", "configure.ac", "configure.in", ".git"),
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never",
                "--cross-file-rename",
                "--completion-style=detailed",
                "--fallback-style=none",
                "--pch-storage=memory",
                "--suggest-missing-includes",
                "--enable-config",
                "--header-insertion-decorators",
                "--all-scopes-completion",
                "--function-arg-placeholders",
                "--folding-ranges",
                "--offset-encoding=utf-16",
            },
            init_options = {
                clangdFileStatus = true,
                usePlaceholders = true,
                completeUnimported = true,
                semanticHighlighting = true,
            },
        })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot", group_index = 2 },
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
