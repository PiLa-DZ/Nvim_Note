#! /bin/bash

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

#mkdir ~/.config/nvim
cp -r ~/00_Github/Nvim_Note/Auto_Install_Lazy_Plugin_Manager/nvim ~/.config

cd

nvim
