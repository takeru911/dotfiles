PYTHON=python
VERSION:=28.2

.PHONY: setup/emacs

setup: setup/emacs setup/cask

$(HOME)/junk-files:
	mkdir $@

setup/emacs: dep /usr/local/bin/emacs
	rm -rf $(HOME)/.emacs.d 
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	cp $(HOME)/dotfiles/emacs/.spacemacs

dep:
	sudo yum -y groupinstall "Development Tools"
	sudo yum -y install gnutls-devel ncurses-devel make
	sudo yum -y install gtk3-devel.x86_64

/usr/local/bin/emacs: /usr/local/src/emacs-$(VERSION).tar.gz
	cd /usr/local/src/; sudo tar -xf /usr/local/src/emacs-$(VERSION).tar.gz
	cd /usr/local/src/emacs-$(VERSION) && sudo ./configure  && sudo make && sudo make install


/usr/local/src/emacs-$(VERSION).tar.gz:
	sudo curl http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-$(VERSION).tar.xz -o /usr/local/src/emacs-$(VERSION).tar.gz
