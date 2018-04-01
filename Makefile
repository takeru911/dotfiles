install: install/zsh install/emacs

install/zsh:
	./zsh/install.sh

install/emacs:
	cd ./emacs/; make setup
