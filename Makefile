SHELL=/usr/bin/zsh
install: mdir dep install install/zsh install/emacs install/tmux install/git install/python

dep:
	sudo yum install wget unzip -y

install/zsh: install/cli-tools clean/zsh
	curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
	@echo "source $(HOME)/dotfiles/zsh/.zshrc" >| $(HOME)/.zshrc
	cp $(HOME)/dotfiles/zsh/.zimrc $(HOME)/.zimrc
	/usr/bin/zsh $(HOME)/.zim/zimfw.zsh install
	/usr/bin/zsh $(HOME)/.zim/zimfw.zsh update

install/cli-tools:
	$(MAKE) -C cli-tools install

clean/zsh:
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.zimrc
	rm -fr $(HOME)/.zim

install/emacs:
	$(MAKE) -C emacs setup

install/git:
	cp ./git/.gitconfig $(HOME)/

install/tmux:
	sudo yum install -y tmux
	cp ./tmux/.tmux.conf $(HOME)/

install/python:
	make -C python install

install/wsl:
	sudo cp ./wsl/wsl.conf /etc/
	sudo dnf install setxkbmap
	sudo setxkbmap jp


mdir:
	mkdir -p $(HOME)/.local/bin

