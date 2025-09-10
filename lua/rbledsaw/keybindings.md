# Neovim Custom Keybindings

This document lists all your custom keybindings, including those set in plugins.
Mappings are shown as `<mode> <key> → <action/description>`
where `<mode>` is `n` (normal), `v` (visual), `i` (insert), or `x` (visual, select).

---

## Global/User Keymaps (`remap.lua` & root `init.lua`)

| Mode | Key                 | Action/Description                                                           |
| ---- | ------------------- | ---------------------------------------------------------------------------- |
| n    | `<leader>pv`        | Open netrw file explorer (`:Ex`)                                             |
| v    | `J`                 | Move visual selection **down** one line and reselect                         |
| v    | `K`                 | Move visual selection **up** one line and reselect                           |
| n    | `J`                 | Join next line to current with cursor return to original position            |
| n    | `K`                 | Insert new line **above**, remain in normal mode, and return to original pos |
| n    | `<C-d>`             | Half-page down & center cursor                                               |
| n    | `<C-u>`             | Half-page up & center cursor                                                 |
| n    | `n`                 | Next search result & center on screen                                        |
| n    | `N`                 | Previous search result & center on screen                                    |
| x    | `<leader>p`         | Paste over selection without overwriting yank register                       |
| n,v  | `<leader>y`         | Yank to system clipboard                                                     |
| n    | `<leader>Y`         | Yank whole line to system clipboard                                          |
| n,v  | `<leader>d`         | Delete to the black hole register (doesn't yank)                             |
| i    | `<C-c>`             | Escape insert mode (`<Esc>`)                                                 |
| n    | `Q`                 | Disable Ex mode (no-op)                                                      |
| n    | `<C-f>`             | Run `tmux-sessionizer` in a new tmux window                                  |
| n    | `<leader>f`         | Format buffer using LSP                                                      |
| n    | `<C-k>`             | Next item in quickfix list & center                                          |
| n    | `<C-j>`             | Previous item in quickfix list & center                                      |
| n    | `<leader>k`         | Next item in location list & center                                          |
| n    | `<leader>j`         | Previous item in location list & center                                      |
| n    | `<leader>s`         | Substitute current word in file (interactive)                                |
| n    | `<leader>x`         | Make current file executable                                                 |
| n    | `<leader><leader>x` | Source current file                                                          |
| n    | `<leader><leader>s` | Source current file (shorthand for `:so`)                                    |
| n    | `<leader>a`         | Telescope: LSP code actions (see plugin section for Harpoon overlap)         |

---

## LSP Attach (root `init.lua` autocmd)

**Buffer-local mappings when LSP attaches:**

| Mode | Key           | Action/Description                  |
| ---- | ------------- | ----------------------------------- |
| n    | `gd`          | Go to definition                    |
| n    | `K`           | Show hover documentation (LSP)      |
| n    | `<leader>vws` | Workspace symbol search             |
| n    | `<leader>vd`  | Show diagnostics in floating window |
| n    | `<leader>vca` | LSP code actions                    |
| n    | `<leader>vrr` | List all references                 |
| n    | `<leader>vrn` | Rename symbol                       |
| i    | `<C-h>`       | Signature help                      |
| n    | `[d`          | Next diagnostic                     |
| n    | `]d`          | Previous diagnostic                 |

---

## Telescope (`telescope.lua`)

| Mode | Key          | Action/Description                       |
| ---- | ------------ | ---------------------------------------- |
| n    | `<leader>pf` | Find files using Telescope               |
| n    | `<C-p>`      | Fuzzy-find Git files (tracked)           |
| n    | `<leader>ps` | Grep for string (user prompt) in project |
| n    | `<leader>vh` | Search help tags                         |

---

## Fugitive (`fugitive.lua`)

| Mode | Key          | Action/Description              |
| ---- | ------------ | ------------------------------- |
| n    | `<leader>gs` | Open Fugitive Git status window |

---

## Harpoon (`harpoon.lua`)

| Mode | Key         | Action/Description                                                            |
| ---- | ----------- | ----------------------------------------------------------------------------- |
| n    | `<leader>a` | **Add current file to Harpoon list** *(overrides `<leader>a` from remap.lua)* |
| n    | `<C-e>`     | Toggle Harpoon quick menu                                                     |
| n    | `<C-h>`     | Go to Harpoon file 1                                                          |
| n    | `<C-t>`     | Go to Harpoon file 2                                                          |
| n    | `<C-n>`     | Go to Harpoon file 3                                                          |
| n    | `<C-s>`     | Go to Harpoon file 4                                                          |

---

## Trouble (`trouble.lua`)

| Mode | Key          | Action/Description               |
| ---- | ------------ | -------------------------------- |
| n    | `<leader>xq` | Toggle Trouble for quickfix list |

---

## Undotree (`undotree.lua`)

| Mode | Key         | Action/Description         |
| ---- | ----------- | -------------------------- |
| n    | `<leader>u` | Toggle UndoTree visualizer |

---

## Copilot (`copilot.lua`)

| Mode | Key     | Action/Description                                         |
| ---- | ------- | ---------------------------------------------------------- |
| i    | `<Tab>` | **Accept entire Copilot suggestion line** (in insert mode) |

*(All other Copilot keys: accept, accept\_word, next, prev, dismiss are disabled)*

---

## LSP Autocompletion (from `lsp.lua` nvim-cmp config)

| Mode | Key         | Action/Description                   |
| ---- | ----------- | ------------------------------------ |
| i    | `<C-p>`     | Select previous completion item      |
| i    | `<C-n>`     | Select next completion item          |
| i    | `<C-y>`     | Confirm completion (accept selected) |
| i    | `<C-Space>` | Trigger completion manually          |

---

## Miscellaneous

* **`<leader>` is mapped to SPACE** (`vim.g.mapleader = " "`)
* Netrw config:

  * Opens in current window (`netrw_browse_split = 0`)
  * Window size: 25% (`netrw_winsize = 25`)

---

## Notes

* **Some keybindings are context-dependent** (for example, LSP and Harpoon, as shown).
* Harpoon’s `<leader>a` will override the global `<leader>a` when loaded.
* Keybindings from plugins like Telescope, Trouble, Fugitive, etc., are only available when those plugins are loaded.
* You can search this doc by keybinding or by plugin to see what each mapping does.

