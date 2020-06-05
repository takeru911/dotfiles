SHELL=/usr/bin/zsh
install: mdir dep install install/win32yank install/zsh install/emacs install/tmux install/git install/python

dep:
	sudo yum install wget unzip -y

install/zsh: $(HOME)/.zplug clean
	cp $(HOME)/dotfiles/zsh/init.zshrc $(HOME)/.zshrc
	-source $(HOME)/.zshrc; \
	zplug install
	rm $(HOME)/.zshrc
	ln -s $(HOME)/.zplug/repos/sorin-ionescu/prezto $(HOME)/.zprezto
	ln -s $(HOME)/.zprezto/runcoms/zlogin $(HOME)/.zlogin
	ln -s $(HOME)/.zprezto/runcoms/zlogout $(HOME)/.zlogout
	ln -s $(HOME)/.zprezto/runcoms/zpreztorc $(HOME)/.zpreztorc
	ln -s $(HOME)/.zprezto/runcoms/zprofile $(HOME)/.zprofile
	ln -s $(HOME)/.zprezto/runcoms/zshenv $(HOME)/.zshenv
	ln -s $(HOME)/.zprezto/runcoms/zshrc $(HOME)/.zshrc
	echo "source $(HOME)/dotfiles/zsh/.zshrc" >> $(HOME)/.zshrc
	-source $(HOME)/.zshrc && zplug install

clean:
	rm -f $(HOME)/.zshrc $(HOME)/.zlogin $(HOME)/.zlogout $(HOME)/.zprofile $(HOME)/.zshenv $(HOME)/.zprofile $(HOME)/.zprezto $(HOME)/.zpreztorc

$(HOME)/.zplug:
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

install/emacs:
	$(MAKE) -C emacs setup

install/git:
	cp ./git/.gitconfig $(HOME)/

install/tmux:
	sudo yum install -y tmux
	cp ./tmux/.tmux.conf $(HOME)/

install/win32yank: $(HOME)/bin/win32yank.exe

$(HOME)/bin/win32yank.exe: VERSION=$(shell curl https://github.com/equalsraf/win32yank/releases/latest | awk -F"=" {'print $$2'} | sed -e 's/>.*//g' -e 's/"//g' -e 's/.*\///g')
$(HOME)/bin/win32yank.exe:
	@echo "INSTALL VERSION: $(VERSION)"
	@wget https://github.com/equalsraf/win32yank/releases/download/$(VERSION)/win32yank-x64.zip -O $(HOME)/bin/win32yank-x64.zip
	@unzip $(HOME)/bin/win32yank-x64.zip win32yank.exe
	@mv win32yank.exe $(HOME)/bin/
	@chmod +x $(HOME)/bin/win32yank.exe
	@rm $(HOME)/bin/win32yank-x64.zip

install/python:
	make -C python install

mdir:
	mkdir -p $(HOME)/bin
