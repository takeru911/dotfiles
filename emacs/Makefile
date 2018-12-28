PYTHON=python

.PHONY: setup/emacs setup/cask

setup: setup/emacs setup/cask

$(HOME)/junk-files:
	mkdir $@

setup/emacs: /usr/local/src/emacs-25.3.tar.gz /usr/local/bin/emacs
	-ln -s $(HOME)/dotfiles/emacs/.emacs.d $(HOME)/.emacs.d 

/usr/local/bin/emacs:
	cd /usr/local/src/; sudo tar -xf /usr/local/src/emacs-25.3.tar.gz
	cd /usr/local/src/emacs-25.3 && sudo ./configure && sudo make && sudo make install


/usr/local/src/emacs-25.3.tar.gz:
	sudo curl http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-25.3.tar.xz -o /usr/local/src/emacs-25.3.tar.gz

setup/cask: $(HOME)/.cask/cask.el
	cd ~/.emacs.d; cask install

$(HOME)/.cask/cask.el:
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | $(PYTHON)
