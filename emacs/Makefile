PYTHON=python

.PHONY: setup/emacs setup/cask

setup: setup/emacs setup/cask

setup/emacs: /usr/local/src/emacs-25.3.tar.gz
	sudo tar -xvf /usr/local/src/emacs-25.3.tar.gz
	cd /usr/local/src/emacs-25.3 && sudo ./configure && sudo make && sudo make install
	ln -s $(HOME)/.emacs.d $(HOME)/dotfiles/emacs/.emacs.d

/usr/local/src/emacs-25.3.tar.gz:
	sudo curl http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-25.3.tar.xz -o /usr/local/src/emacs-25.3.tar.gz

setup/cask: $(HOME)/.cask/cask.el
	cask install

$(HOME)/.cask/cask.el:
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | $(PYTHON)
