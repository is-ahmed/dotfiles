# Created by newuser for 5.9

export PATH=$PATH:/usr/local/go/bin

alias nvim="$HOME/AppImages/nvim.appimage"
alias ls="ls --color"
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
PROMPT="%F{magenta}%n%f %F{cyan}%1~%f %B❯%b "
RPROMPT="%t"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
