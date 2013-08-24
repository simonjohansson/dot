#!/usr/bin/bash

DOT_PATH=~/src/dot

# Setup xmonad config
ln -fs $DOT_PATH/.xmonad ~/.xmonad

# Setup zshrc.
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
ln -fs $DOT_PATH/.zshrc ~/.zshrc

# Setup the xfce4-terminal
mkdir -p ~/.config/xfce4/terminal && ln -fs $DOT_PATH/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc

ln -fs $DOT_PATH/.xinitrc ~/.xinitrc
