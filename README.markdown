# wild34-vim : Vim Distribution from Sergio Scalpone

```
                 _ _     _ ____  _  _
                (_) |   | |___ \| || |
       __      ___| | __| | __) | || |_
       \ \ /\ / / | |/ _` ||__ <|__   _|
        \ V  V /| | | (_| |___) |  | |
         \_/\_/ |_|_|\__,_|____/   |_|

```

The distribution is completely customisable using a `~/.config/nvim/local.vim`, `~/.config/nvim/bundles.local.vim`, and `~/.config/nvim/before.local.vim` Vim RC files.

# Key bindings

#### Normal mode:
--------------------------------------------------------
| **Ctrl + {H,J,K,L}**    | move across windows
| **Shift + {H,L}**       | prev, next tab
|                         |
| **<Leader>bg**          | switch background dark/light
| **<Leader>bd**          | delete buffer and close tab
| **<Leader>ba**          | close all other buffers
| **<Leader>ss**          | toggle spell
| **<Leader>f[0-9]**      | set fold level
| **<Leader>fc **         | find Git conflict markers
| Fzf:                    |
| **<Leader>y **          | open yank history for unnamed register `"` and paste after the cursor
| **<Leader>Y **          | open yank history but paste before the cursor using Fzf
| **<Leader>b **          | open buffer list with Fzf
| **<Leader>: **          | Fzf all vim commands (not history)
|                         |
| **<LocalLeader>/ **     | toggle search highlight
------------------------------------------------------------

#### Visual mode:
**<Leader>y**           | replace selection from yank history using Fzf
