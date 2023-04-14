install:
	sudo cp ./gofigure /usr/bin/gofigure
	sudo chmod +x /usr/bin/gofigure
	@if [ ! -d ~/.config/gofigure/ ]; then\
		mkdir -p ~/.config/gofigure/ ;\
	fi
	@if [ ! -f ~/.config/gofigure/gofigure.yaml ]; then\
		cp ./gofigure.yaml ~/.config/gofigure/gofigure.yaml ;\
	fi

uninstall:
	sudo rm /usr/bin/gofigure

wipe:
	sudo rm /usr/bin/gofigure
	sudo rm -rf ~/.config/gofigure/
