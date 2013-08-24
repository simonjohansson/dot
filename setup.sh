#!/usr/bin/bash

DOT_PATH=~/src/dot

# Setup xmonad config
rm -rf ~/.xmonad && ln -s $DOT_PATH/.xmonad ~/.xmonad

# Setup zshrc.
rm -f ~/.zshrc && ln -s $DOT_PATH/.zshrc ~/.zshrc
