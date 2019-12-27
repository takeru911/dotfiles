SHELL=/usr/bin/zsh
install: install/zsh install/emacs

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
	source $(HOME)/.zshrc; \
	zplug install
clean:
	rm -f $(HOME)/.zshrc $(HOME)/.zlogin $(HOME)/.zlogout $(HOME)/.zprofile $(HOME)/.zshenv $(HOME)/.zprofile $(HOME)/.zprezto $(HOME)/.zpreztorc

$(HOME)/.zplug:
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

install/emacs:
	cd ./emacs/; make setup

install/git:
	cp ./git/.gitconfig $(HOME)/
