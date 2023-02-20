PYTHON=python
VERSION:=28.2

.PHONY: setup/emacs

setup: setup/emacs setup/cask

$(HOME)/junk-files:
	mkdir $@

setup/emacs: dep /usr/local/bin/emacs
	rm -rf $(HOME)/.emacs.d 
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	cp $(HOME)/dotfiles/emacs/.spacemacs ~/

dep:
	sudo dnf -y groupinstall "Development Tools"
	sudo dnf -y install gnutls-devel ncurses-devel make
	sudo dnf -y install gtk3-devel.x86_64
	sudo dnf -y install dnf-plugins-core epel-release
	sudo dnf config-manager --set-enabled powertools
	sudo dnf -y install libjpeg-devel giflib-devel libtiff-devel libXpm-devel

/usr/local/bin/emacs: /usr/local/src/emacs-$(VERSION).tar.gz
	cd /usr/local/src/; sudo tar -xf /usr/local/src/emacs-$(VERSION).tar.gz
	cd /usr/local/src/emacs-$(VERSION) && sudo ./configure  && sudo make && sudo make install


/usr/local/src/emacs-$(VERSION).tar.gz:
	sudo curl http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-$(VERSION).tar.xz -o /usr/local/src/emacs-$(VERSION).tar.gz
