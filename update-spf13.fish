#! /usr/bin/fish

set NVIM_DIR ~/.config/nvim
set SPF13_DIR $NVIM_DIR/spf13

if test -d $SPF13_DIR
    echo "Updating spf13-vim config bundle..."
    cd $SPF13_DIR; git pull
else
    echo "Installing spf13-vim config bundle...  "
    cd $NVIM_DIR; git clone https://github.com/spf13/spf13-vim $SPF13_DIR
end

cd $SPF13_DIR
sed -e 's!~/.vimrc[^.]!~/.config/nvim/init.vim!g' \
    -e 's!\~/\.vimrc\.\([a-z]*\(\.[a-z]*\)*\)!~/.config/nvim/\1.vim!g' \
    -e 's!~/.vim/bundle/\([a-z/]*\)!~/.local/share/nvim/plugged/\1!g' \
    .vimrc > $NVIM_DIR/init.vim
sed -e 's!~/.vimrc[^.]!~/.config/nvim/init.vim!g' \
    -e 's!\~/\.vimrc\.\([a-z]*\(\.[a-z]*\)*\)!~/.config/nvim/\1.vim!g' \
    -e 's!~/.vim/bundle/\([a-z/]*\)!~/.local/share/nvim/plugged/\1!g' \
    .vimrc.before > $NVIM_DIR/before.vim
cd -

# Install vim-plug if needed
set VIM_PLUG ~/.local/share/nvim/site/autoload/plug.vim
test -f $VIM_PLUG; or begin
    echo -n "Installing 'vim-plug'...  "
    curl --silent -fLo $VIM_PLUG --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; and echo OK; or echo "  Error"
end
