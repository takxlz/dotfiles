#!/bin/zsh
FROM=~/Library/"Application Support"/Code/User
TO=~/dotfiles/vscode

cp -f $FROM/settings.json $TO/.
cp -f $FROM/keybindings.json $TO/.

cd $TO
code --list-extensions > extensions.txt
