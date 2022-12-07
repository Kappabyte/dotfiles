# Add pacman aliases
alias install sudo pacman -S
alias uninstall sudo pacman -R
alias update sudo pacman -Syu

# Add systemd aliases
start() {
	sudo systemctl start $1
	sudo systemctl status $1
}
restart() {
	sudo systemctl restart $1
	sudo systemctl status $1
}
stop() {
	sudo systemctl stop $1
	sudo systemctl status $1
}
status() {
	sudo systemctl status $1
}
enable() {
	sudo systemctl enable $1
}
# Add support for The Fuck
eval $(thefuck --alias)
