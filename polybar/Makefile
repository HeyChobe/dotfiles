PREFIX ?= /usr
DESTDIR ?=$(PREFIX)/share/colorblocks
BINDIR ?= $(PREFIX)/bin

all:
	@echo "Colorblocks is a shell script, so there is nothing to do. Try using \"make install\" instead."

install:
	@install -v -d "$(DESTDIR)" && \
		install -m 0755 -v colorblocks "$(DESTDIR)" && \
		install -m 0644 -v bars.ini "$(DESTDIR)" && \
		install -m 0644 -v colors.ini "$(DESTDIR)" && \
		install -m 0644 -v config.ini "$(DESTDIR)" && \
		install -m 0644 -v license.txt "$(DESTDIR)" && \
		install -m 0644 -v modules.ini "$(DESTDIR)" && \
		install -m 0644 -v preview.ini "$(DESTDIR)" && \
		install -m 0644 -v preview.sh "$(DESTDIR)" && \
		install -m 0644 -v readme.md "$(DESTDIR)" && \
		install -m 0644 -v user_modules.ini "$(DESTDIR)" && \
		install -v -d "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/color-switch.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/colors-dark.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/colors-light.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/launcher.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/powermenu.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/pywal.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/random.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/run.sh "$(DESTDIR)/scripts" && \
		install -m 0755 -v scripts/sdir.sh "$(DESTDIR)/scripts" && \
		install -v -d "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/colors.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/confirm.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/defaultfont.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/launcher.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/message.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/networkmenu.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/powermenu.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -m 0644 -v scripts/rofi_template/styles.rasi "$(DESTDIR)/scripts/rofi_template" && \
		install -v -d "$(BINDIR)" && \
		ln -s "$(DESTDIR)/colorblocks" "$(BINDIR)/colorblocks"

uninstall:
	@printf 'Removing all files under $(DESTDIR)\n'
	@rm \
		"$(DESTDIR)/colorblocks" \
		"$(DESTDIR)/bars.ini" \
		"$(DESTDIR)/colors.ini" \
		"$(DESTDIR)/config.ini" \
		"$(DESTDIR)/license.txt" \
		"$(DESTDIR)/modules.ini" \
		"$(DESTDIR)/preview.ini" \
		"$(DESTDIR)/preview.sh" \
		"$(DESTDIR)/readme.md" \
		"$(DESTDIR)/user_modules.ini" \
		"$(DESTDIR)/scripts/color-switch.sh" \
		"$(DESTDIR)/scripts/colors-dark.sh" \
		"$(DESTDIR)/scripts/colors-light.sh" \
		"$(DESTDIR)/scripts/launcher.sh" \
		"$(DESTDIR)/scripts/powermenu.sh" \
		"$(DESTDIR)/scripts/pywal.sh" \
		"$(DESTDIR)/scripts/random.sh" \
		"$(DESTDIR)/scripts/run.sh" \
		"$(DESTDIR)/scripts/sdir.sh" \
		"$(DESTDIR)/scripts/rofi_template/colors.rasi" \
		"$(DESTDIR)/scripts/rofi_template/confirm.rasi" \
		"$(DESTDIR)/scripts/rofi_template/defaultfont.rasi" \
		"$(DESTDIR)/scripts/rofi_template/launcher.rasi" \
		"$(DESTDIR)/scripts/rofi_template/message.rasi" \
		"$(DESTDIR)/scripts/rofi_template/networkmenu.rasi" \
		"$(DESTDIR)/scripts/rofi_template/powermenu.rasi" \
		"$(DESTDIR)/scripts/rofi_template/styles.rasi"
	@printf 'Removing empty remaining directories\n'
	@rmdir \
		"$(DESTDIR)/scripts/rofi_template" \
		"$(DESTDIR)/scripts" \
		"$(DESTDIR)"
	@unlink "$(BINDIR)/colorblocks"
