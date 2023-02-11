#!/bin/sh

# Optionally install nerd fonts if needed
dotfiles="$HOME/dotifles"
option='n'

echo "Install ryanoasis/nerd-fonts? (y/n)"
read option

if [[ option -eq 'y' ]]
then
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
else
	echo "Nerd fonts will not be installed"
fi


ln -s ${dotfiles}/nvim ~/.config/
ln -s ${dotfiles}/tmux/.tmux.conf ~/





