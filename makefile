all : home/.slate home/.zshrc home/.vimrc home/.vimrc.bundles home/.oh-my-zsh/custom/jedcn.zsh-theme

home/.slate : org/slate.org
		./tangle-file.sh org/slate.org

home/.zshrc : org/zshrc.org
		./tangle-file.sh org/zshrc.org

home/.vimrc : org/vim.org
		./tangle-file.sh org/vim.org

home/.vimrc.bundles : org/vim.org
		./tangle-file.sh org/vim.org

home/.oh-my-zsh/custom/jedcn.zsh-theme : org/oh-my-zsh/custom/jedcn.zsh-theme.org
		./tangle-file.sh org/oh-my-zsh/custom/jedcn.zsh-theme.org
