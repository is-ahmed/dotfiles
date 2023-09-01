#!/bin/sh


my_config="$HOME/myconfig"

# Install packer if not present, make sure Github keys are setup
PACKER_DIR=~/.local/share/nvim/site/pack/packer/start/packer.nvim/.git
if [ ! -d $PACKER_DIR ]
then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Copy neovim plugins to ~/.local/share/nvim
#cp ./.local/share/nvim ~/.local/share/nvim

# Install tpm if not present
TPM_DIR="~/.tmux/plugins/tpm/.git"
if [ ! -d $TPM_DIR ]
then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi


# Install zsh plugins
PLUGINS=(
"git@github.com:zsh-users/zsh-history-substring-search.git"
"git@github.com:zsh-users/zsh-syntax-highlighting.git"
"git@github.com:zsh-users/zsh-autosuggestions.git"
"git@github.com:romkatv/powerlevel10k.git"
)

for repo in "${PLUGINS[@]}"
do
	base_name=$(basename $repo)
	file_name=${base_name%.*}
	download_path="~/.config/zsh/$file_name"
	if [ ! -d download_path ]
	then
		git clone $repo ~/.config/zsh/$file_name
	fi
done

# Install ripgrep for telescope fuzzy finding
sudo apt update && sudo apt install ripgrep -y


ln -s ${my_config}/nvim ~/.config/
ln -s ${my_config}/tmux/.tmux.conf ~/
ln -s ${my_config}/zsh/.zshrc ~/

source ~/.tmux.conf
source ~/.zshrc 

# Additional notes for setting up the config (for myself)
# For tree-sitter, make sure to run :TSInstall all
# Also may need to comment some stuff in nvim config to install plugin





