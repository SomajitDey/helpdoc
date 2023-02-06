install_dir := /usr/local/bin
bashcomp_install_dir := /etc/bash_completion.d

.PHONY: install uninstall

install: helpdoc helpdoc_completion.sh
	sudo install helpdoc $(install_dir)
	sudo install helpdoc_completion.sh $(bashcomp_install_dir)/helpdoc
	sudo helpdoc -e helpdoc
	@echo 'Installation successful'

uninstall:
	sudo helpdoc -d helpdoc
	sudo rm -f $(install_dir)/helpdoc
	sudo rm -f $(bashcomp_install_dir)/helpdoc
	@echo 'Successfully removed helpdoc'
