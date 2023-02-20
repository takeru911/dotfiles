LOCAL_BIN:=$(HOME)/.local/bin

.PHONY: clean/fzf clean/exa clean 

install: install/direnv install/exa install/fzf install/fd install/bat install/win32yank install/ghq

install/direnv: $(LOCAL_BIN)/direnv

install/exa: $(LOCAL_BIN)/exa

install/fzf: $(LOCAL_BIN)/fzf

install/fd: $(LOCAL_BIN)/fd

install/bat: $(LOCAL_BIN)/bat

install/ghq: $(LOCAL_BIN)/ghq

install/win32yank: $(LOCAL_BIN)/win32yank.exe

$(LOCAL_BIN)/direnv:
	wget -P /tmp/ https://github.com/direnv/direnv/releases/download/v2.32.2/direnv.linux-amd64
	mv /tmp/direnv.linux-amd64 $(LOCAL_BIN)/direnv
	chmod +x $(LOCAL_BIN)/direnv

$(LOCAL_BIN)/bat: clean/bat
	wget -P /tmp/ https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
	tar -xvf /tmp/bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz -C /tmp/
	mv /tmp/bat-v0.22.1-x86_64-unknown-linux-gnu/bat $(LOCAL_BIN)/bat
	touch $(LOCAL_BIN)/bat
	$(MAKE) clean/bat

$(LOCAL_BIN)/fd: clean/fd
	wget -P /tmp/ https://github.com/sharkdp/fd/releases/download/v8.6.0/fd-v8.6.0-x86_64-unknown-linux-gnu.tar.gz
	tar -xvf /tmp/fd-v8.6.0-x86_64-unknown-linux-gnu.tar.gz -C /tmp/
	mv /tmp/fd-v8.6.0-x86_64-unknown-linux-gnu/fd $(LOCAL_BIN)/fd
	touch $(LOCAL_BIN)/fd
	$(MAKE) clean/fd

$(LOCAL_BIN)/fzf: clean/fzf
	wget -P /tmp/ https://github.com/junegunn/fzf/releases/download/0.35.1/fzf-0.35.1-linux_amd64.tar.gz
	tar -xvf /tmp/fzf-0.35.1-linux_amd64.tar.gz
	mv ./fzf $(LOCAL_BIN)/
	touch $(LOCAL_BIN)/fzf
	wget -P /tmp/ https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh
	wget -P /tmp/ https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh
	cat /tmp/key-bindings.zsh /tmp/completion.zsh >| $(HOME)/.fzf.zsh
	$(MAKE) clean/fzf

$(LOCAL_BIN)/exa: clean/exa
	wget -P /tmp/ https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
	unzip /tmp/exa-linux-x86_64-v0.10.1.zip -d /tmp/exa-linux-x86_64-v0.10.1
	mv /tmp/exa-linux-x86_64-v0.10.1/bin/exa $(LOCAL_BIN)/exa
	touch $(LOCAL_BIN)/exa
	$(MAKE) clean/exa

$(LOCAL_BIN)/win32yank.exe:
	wget -P /tmp/ https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
	unzip /tmp/win32yank-x64.zip -d /tmp/
	mv /tmp/win32yank.exe $(LOCAL_BIN)
	chmod +x $(LOCAL_BIN)/win32yank.exe
	rm /tmp/win32yank-x64.zip
$(LOCAL_BIN)/ghq:
	wget -P /tmp/ https://github.com/x-motemen/ghq/releases/download/v1.2.1/ghq_linux_amd64.zip
	unzip /tmp/ghq_linux_amd64.zip -d /tmp/
	mv /tmp/ghq_linux_amd64/ghq $(LOCAL_BIN)
	rm -rf /tmp/ghq_linux_amd64

clean:  clean/exa clean/fzf clean/fd clean/bat

clean/bat:
	rm -rf /tmp/bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
	rm -rf /tmp/bat-v0.22.1-x86_64-unknown-linux-gnu

clean/fd:
	rm -rf /tmp/fd-v8.6.0-x86_64-unknown-linux-gnu.tar.gz
	rm -rf /tmp/fd-v8.6.0-x86_64-unknown-linux-gnu

clean/fzf:
	-rm ./fzf
	rm -rf fzf-0.35.1-linux_arm64.tar.gz
	-rm /tmp/key-bindngs.zsh
	-rm /tmp/completion.zsh 

clean/exa:
	rm -rf /tmp/exa-linux-x86_64-v0.10.1.zip
	rm -rf /tmp/exa-linux-x86_64-v0.10.1
