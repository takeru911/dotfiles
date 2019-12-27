INSTALL_FILE:=/tmp/Miniconda3-latest-Linux-x86_64.sh


install: $(INSTALL_FILE)
	sh $(INSTALL_FILE)

$(INSTALL_FILE):
	@wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $(INSTALL_FILE)
