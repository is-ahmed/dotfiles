#!/bin/sh

# Optionally install nerd fonts if needed
myconfig="$HOME/myconfig"
option='n'

echo "Install ryanoasis/nerd-fonts? (y/n)"
read option

if [[ "$option" == 'y' ]]
then
	echo "Nerd fonts will be installed"
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
else
	echo "Nerd fonts will not be installed"
fi

rm ~/.config/nvim
rm ~/.tmux.conf

ln -s ${myconfig}/nvim ~/.config/
ln -s ${myconfig}/tmux/.tmux.conf ~/
ln -s ${myconfig}/zsh/.zshrc ~/

# Additional notes for setting up the config (for myself)
# For telescope fuzzy finding, make sure ripgrep is installed
# Make sure packer is separately installed first
# For zsh plugins, install plugins to ~/.config/zsh before sourcing
# For tree-sitter, make sure to run :TSInstall all





