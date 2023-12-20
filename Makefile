PROG ?= vpn
PREFIX ?= $(HOME)/.local
DESTDIR ?= /bin
SYSTEMD_DIR ?= $(HOME)/.config/systemd/user
SYSTEMD_VPN_SERVICE ?= vpn.service

install:
	install -d "$(PREFIX)$(DESTDIR)"
	install -m 0755 $(PROG) "$(PREFIX)$(DESTDIR)/$(PROG)"
	install -d $(SYSTEMD_DIR)
	install -m 0644 $(SYSTEMD_VPN_SERVICE) "$(SYSTEMD_DIR)/"
	systemctl --user daemon-reload
	systemctl --user enable $(SYSTEMD_VPN_SERVICE)
	systemctl --user start $(SYSTEMD_VPN_SERVICE)

uninstall:
	systemctl --user stop $(SYSTEMD_VPN_SERVICE)
	systemctl --user disable $(SYSTEMD_VPN_SERVICE)
	rm "$(SYSTEMD_DIR)/$(SYSTEMD_VPN_SERVICE)"
	systemctl --user daemon-reload
	rm "$(PREFIX)$(DESTDIR)/$(PROG)"

.PHONY: install uninstall
