PYTHON=python

.PHONY: setup/emacs setup/cask

setup: setup/emacs setup/cask

$(HOME)/junk-files:
	mkdir $@

setup/emacs: /usr/local/src/emacs-26.3.tar.gz dep /usr/local/bin/emacs
	-ln -s $(HOME)/dotfiles/emacs/.emacs.d $(HOME)/.emacs.d 

dep:
	yum -y groupinstall "Development Tools"
	yum -y install gnutls-devel ncurses-devel make

/usr/local/bin/emacs:
	cd /usr/local/src/; sudo tar -xf /usr/local/src/emacs-26.3.tar.gz
	cd /usr/local/src/emacs-26.3 && sudo ./configure --with-x-toolkit=no --with-jpeg=no  && sudo make && sudo make install


/usr/local/src/emacs-26.3.tar.gz:
	sudo curl http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-26.3.tar.xz -o /usr/local/src/emacs-26.3.tar.gz

setup/cask: $(HOME)/.cask/cask.el
	cd ~/.emacs.d; cask install

$(HOME)/.cask/cask.el:
	curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | $(PYTHON)
