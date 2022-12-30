INSTALL_FILE:=/tmp/Miniconda3-latest-Linux-x86_64.sh

install: install/python install/pyenv install/pipx

install/python:
	sudo dnf install python39
	-ln -s /usr/bin/python3.9 /usr/bin/python
	-ln -s /usr/bin/pip3.9 /usr/bin/pip

install/pyenv:
	curl https://pyenv.run | bash

install/pipx:
	pip install --user pipx
	pipx install awscli
	pipx install poetry
	pipx install virtualenv
