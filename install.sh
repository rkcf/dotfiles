#!/bin/sh

files=( .vimrc .zshrc .tmux.conf .xmobarrc )
copy_cmd="cp --recursive --interactive --backup --suffix=.backup"

mkdir --parents ~/.xmonad ~/.config/termite

echo "Copying over files..."

$copy_cmd $PWD/.xmonad/xmonad.hs ~/.xmonad
$copy_cmd $PWD/.config/termite/config ~/.config/termite

for file in ${files[@]}
do
    $copy_cmd $PWD/$file ~/ 
done

echo "Done!"
