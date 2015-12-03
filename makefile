all : home/.emacs.d/init.el home/.slate home/.zshrc home/.vimrc home/.vimrc.bundles home/.oh-my-zsh/custom/jedcn.zsh-theme home/.hammerspoon/init.lua

home/.emacs.d/init.el : org/.emacs.d/init.org
		mkdir -p org/.emacs.d/org/.emacs.d/
		./scripts/load-file-in-place.sh org/.emacs.d init.org
		mv org/.emacs.d/init.el home/.emacs.d/init.el

home/.slate : org/slate.org
		./scripts/tangle-file.sh org/slate.org

home/.zshrc : org/zshrc.org
		./scripts/tangle-file.sh org/zshrc.org

home/.vimrc : org/vim.org
		./scripts/tangle-file.sh org/vim.org

home/.vimrc.bundles : org/vim.org
		./scripts/tangle-file.sh org/vim.org

home/.oh-my-zsh/custom/jedcn.zsh-theme : org/oh-my-zsh/custom/jedcn.zsh-theme.org
		./scripts/tangle-file.sh org/oh-my-zsh/custom/jedcn.zsh-theme.org

home/.hammerspoon/init.lua : org/.hammerspoon/init.lua.org
		./scripts/tangle-file.sh org/.hammerspoon/init.lua.org
