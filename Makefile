install: install/zsh install/emacs

install/zsh: $(HOME)/.zplug
	./zsh/install.sh

$(HOME)/.zplug:
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

install/emacs:
	cd ./emacs/; make setup
