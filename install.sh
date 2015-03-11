#!/bin/sh

files=( .vimrc .zshrc .tmux.conf .xmobarrc .Xresources )
copy_cmd="cp --recursive --interactive --backup --suffix=.backup"

mkdir --parents ~/.xmonad

echo "Copying over files..."

$copy_cmd $PWD/.xmonad/xmonad.hs ~/.xmonad

for file in ${files[@]}
do
    $copy_cmd $PWD/$file ~/ 
done

echo "Done!"
