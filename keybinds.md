# Keybindings

This file documents all the keybindings in your Neovim configuration.

## General

| Key | Mode | Action |
|---|---|---|
| `va` | Normal | Visual select all |
| `<leader>q` | Normal | Quit |
| `<leader>w` | Normal | Write |
| `<leader>h` | Normal | No highlight |
| `<C-s>` | Normal | Write |
| `<S-q>` | Normal | Force quit |
| `ciw` | Normal | Change inside word (black hole register) |
| `yp` | Normal | Yank file path |
| `<C-u>` | Normal | Scroll up and center |
| `<C-d>` | Normal | Scroll down and center |
| `<C-w>` | Insert | Delete word backwards |
| `,u` | Insert | Underline word |
| `,c` | Insert | Add checkmark |

## Harpoon

| Key | Mode | Action |
|---|---|---|
| `<leader>hm` | Normal | Add file to harpoon |
| `<leader>he` | Normal | Toggle harpoon menu |
| `<leader>hp` | Normal | Harpoon previous |
| `<leader>hn` | Normal | Harpoon next |

## FZF Lua

| Key | Mode | Action |
|---|---|---|
| `<C-f>` | Normal | Find files |
| `<leader>g` | Normal | Live grep |
| `<leader>f` | Normal | FZF Lua |
| `<leader>R` | Normal | Resume FZF Lua |

## LSP

| Key | Mode | Action |
|---|---|---|
| `gd` | Normal | Go to definition |
| `K` | Normal | Hover documentation |
| `gi` | Normal | Go to implementation |
| `<leader>rn` | Normal | Rename |
| `<leader>ca` | Normal | Code action |
| `gr` | Normal | References |
| `<leader>f` | Normal | Format |

## nvim-cmp

| Key | Mode | Action |
|---|---|---|
| `<C-d>` | Insert | Scroll documentation down |
| `<C-f>` | Insert | Scroll documentation up |
| `<C-Space>` | Insert | Complete |
| `<C-e>` | Insert | Abort completion |
| `<CR>` | Insert | Confirm completion |

## goto-preview

| Key | Mode | Action |
|---|---|---|
| `gpd` | Normal | Preview definition |
| `gpi` | Normal | Preview implementation |
| `gpr` | Normal | Preview references |

## nvim-tree

| Key | Mode | Action |
|---|---|---|
| `<leader>e` | Normal | Toggle nvim-tree |
| `<leader>f` | Normal | Find file in nvim-tree |

## align.nvim

| Key | Mode | Action |
|---|---|---|
| `aa` | Visual | Align to char |
| `ad` | Visual | Align to char with preview |
| `aw` | Visual | Align to string |
| `ar` | Visual | Align to regex |
| `gaw` | Normal | Align operator to string |
| `gaa` | Normal | Align operator to char |

## multicursor.nvim

| Key | Mode | Action |
|---|---|---|
| `<up>` | Normal/Visual | Add cursor up |
| `<down>` | Normal/Visual | Add cursor down |
| `<leader><up>` | Normal/Visual | Skip cursor up |
| `<leader><down>` | Normal/Visual | Skip cursor down |
| `<leader>n` | Normal/Visual | Add cursor to next match |
| `<leader>s` | Normal/Visual | Skip next match |
| `<leader>N` | Normal/Visual | Add cursor to previous match |
| `<leader>S` | Normal/Visual | Skip previous match |
| `<c-leftmouse>` | Normal | Handle mouse |
| `<c-leftdrag>` | Normal | Handle mouse drag |
| `<c-leftrelease>`| Normal | Handle mouse release |
| `mw` | Normal/Visual | Add cursors to all matches |
| `<c-q>` | Normal/Visual | Toggle cursor |
| `ga` | Normal | Add cursor operator |
| `S` | Visual | Split cursors |
| `<left>` | Normal/Visual | Previous cursor |
| `<right>` | Normal/Visual | Next cursor |
| `<leader>x` | Normal/Visual | Delete cursor |
| `<esc>` | Normal | Enable/disable cursors |

## neofs

| Key | Mode | Action |
|---|---|---|
| `<leader>n` | Normal | Open neofs |

## Compiler

| Key | Mode | Action |
|---|---|---|
| `<F5>` | Normal | TMUX Compile Run |
| `,b` | Normal | TMUX Compile Run |
| `<leader>b` | Normal | TMUX Compile RunV |
| `,c` | Normal | Compile |
| `<leader>r` | Normal | Recompile |
| `<F6>` | Normal | CompilerOpen |
| `<S-F6>` | Normal | CompilerStop and CompilerRedo |
| `<S-F7>` | Normal | CompilerToggleResults |
| `<leader>c` | Normal | Show compiler output |

## Quickfix

| Key | Mode | Action |
|---|---|---|
| `<C-k>` | Normal | Previous quickfix item |
| `<C-j>` | Normal | Next quickfix item |
| `<C-E>` | Normal | Open quickfix window |
| `<space>o` | Normal | Toggle quickfix window |

## Tabs

| Key | Mode | Action |
|---|---|---|
| `<C-Tab>` | Normal | Next tab |
| `<C-S-Tab>` | Normal | Previous tab |
| `<C-PageDown>` | Normal | Next tab |
| `<C-PageUp>` | Normal | Previous tab |
| `<C-Right>` | Normal | Next tab |
| `<C-Left>` | Normal | Previous tab |

## Other

| Key | Mode | Action |
|---|---|---|
| `ciw` | Normal | Change inside word (black hole register) |
| `<C-w>` | Insert | Delete word backwards |
| `yp` | Normal | Yank file path |
| `<C-u>` | Normal | Scroll up and center |
| `<C-d>` | Normal | Scroll down and center |
| `,u` | Insert | Underline with `-` |
| `,c` | Insert | Add checkmark emoji |
| `<C-=>` | Normal | Zoom in |
| `<A-S-k>` | Normal | Zoom in |
| `<C-->` | Normal | Zoom out |
| `<A-S-j>` | Normal | Zoom out |
| `,o` | Normal | Toggle compilation buffer |