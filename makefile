all : home/.zshrc home/.oh-my-zsh/custom/jedcn.zsh-theme

home/.zshrc : org/zshrc.org
		./tangle-file.sh org/zshrc.org

home/.oh-my-zsh/custom/jedcn.zsh-theme : org/oh-my-zsh/custom/jedcn.zsh-theme.org
		./tangle-file.sh org/oh-my-zsh/custom/jedcn.zsh-theme.org
