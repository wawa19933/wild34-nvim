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

### Fzf
```
<leader>y :FZFNeoyank<cr>           " Open yank history for register `"` and paste after the cursor
<leader>Y :FZFNeoyank " P<cr>       " Open yank history but paste before the cursor
<leader>y :FZFNeoyankSelection<cr>  " In visual mode replace selection from yank history
```