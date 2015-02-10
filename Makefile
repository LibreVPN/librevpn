# The default target is the first target listed.  We declare 'default' first
# thing, so we don't have to worry about the order later
default: all

# Configuration ################################################################

# Where to install to.
# PREFIX is the install prefix, most programs on a system are "/" or "/usr"
# TARGET is a staging directory to install to, a sort of 'root' directory
TARGET ?=
PREFIX ?= /usr/local
# If this were a GNU package, 'TARGET' would be called 'DESTDIR', and 'PREFIX'
# would be 'prefix'

# Supplemental/derived install directories.  Again, if we wanted to be
# consistent with GNU, they would have different names.
LIBDIR ?= $(PREFIX)/lib/$(NETWORK)
DOC ?= $(PREFIX)/share/$(NETWORK)/doc
CONTRIB ?= $(PREFIX)/share/$(NETWORK)/contrib
HOSTS ?= $(PREFIX)/share/$(NETWORK)/hosts
BEADLE ?= $(PREFIX)/share/$(NETWORK)/beadle

# Gettext
TEXTDOMAINDIR ?= $(PREFIX)/share/locale
TEXTDOMAIN ?= $(NETWORK)

# Nombre de la red
NETWORK ?= lvpn
# La configuración de tinc
TINC ?= /etc/tinc/$(NETWORK)
# `lvpn`
LVPN ?= $(PREFIX)/bin/$(NETWORK)

# Flags por defecto para el daemon
FLAGS ?= --logfile -U nobody
# Tamaño de las llaves
KEYSIZE ?= 4096
# Puerto por defecto
PORT ?= 655

# Las subredes
SUBNET ?= 192.168.9.0/24
SUBNET6 ?= 2001:1291:200:83ab::/64

# Sub-projects to optionally build
#BUILD_UPNPC = true
#BUILD_LIBNATPMP = true
BUILD_GEN_IPV6 = true
BUILD_CONTRIB = true

# Set up some runtime variables ################################################

# The language that the messages in the source are.
native_lang = es
# Detect available translations
langs = $(sort $(native_lang) $(notdir $(wildcard doc/* locale/*)))

arch := $(shell uname -m)

# The source and output files of our 'compile' routines
src_sh = lvpn.in
out_sh = $(patsubst %.in,%.out,$(src_sh))
src_po = $(wildcard locale/*/LC_MESSAGES/*.po)
out_po = $(patsubst %.po,%.mo,$(src_po))
src_man = $(wildcard doc/*/*.markdown)
out_man = $(patsubst %.markdown,%.1,$(src_man))

# List of host names that we have files for
hosts = $(notdir $(wildcard hosts/*))
# List of man pages to install, structured like relative directories to /usr/share/man
mans = $(patsubst en/%,./%,$(subst /,/man1/,$(patsubst doc/%,%,$(out_man))))
# The list of programs to install to $(PREFIX)/bin
bins = lvpn

# List of subdirectories to recurse into
SUBDIRS =

# Add the hooks for optionally compiled sub-projects ###########################

ifdef BUILD_UPNPC
bins += upnpc
SUBDIRS += etc/miniupnpc
$(TARGET)$(PREFIX)/bin/%: etc/miniupnpc/%-shared
	install -Dm755 '$<' '$@'
endif

ifdef BUILD_LIBNATPMP
bins += natpmpc
SUBDIRS += etc/libnatpmp
$(TARGET)$(PREFIX)/bin/%: etc/libnatpmp/%-shared
	install -Dm755 '$<' '$@'
endif

ifdef BUILD_GEN_IPV6
bins += $(arch)-generate-ipv6-address
SUBDIRS += etc/generate-ipv6-address-0.1
$(TARGET)$(PREFIX)/bin/%: etc/generate-ipv6-address-0.1/%
	install -Dm755 '$<' '$@'
endif

ifdef BUILD_CONTRIB
bins += collectd-lvpn
$(TARGET)$(PREFIX)/bin/%: contrib/collectd/%
	install -Dm755 '$<' '$@'
endif

# All the high-level 'phony' targets ###########################################

all: PHONY build man locale
clean-all: PHONY clean man-clean locale-clean

build: PHONY $(out_sh) $(addsuffix /all,$(SUBDIRS))
clean: PHONY $(addsuffix /clean,$(SUBDIRS))
	rm -rf $(out_sh)

man: PHONY $(out_man)
man-clean: PHONY
	rm -rf $(out_man)

locale: PHONY $(out_po)
locale-clean: PHONY
	rm -rf $(out_po)

# This loops over the configured sub-projects to proxy targets to them.
# '${subdirectory}/${target}' runs 'make ${target}' in that subdirectory.
$(foreach subdir,$(SUBDIRS),$(eval \
$(subdir)/%: ; \
	$$(MAKE) -C '$(subdir)' '$$*' \
))

# If we wanted to run 'make install' in each of the sub-projects, we would have
# 'install' depend on this:
#      $(addsuffix /install,$(SUBDIRS))
# However, instead we've added rules to know how to find programs named in
# $(bin) from the relevent sub-directories, so 'install-bin' installs them, and
# we don't have to recurse. This is a questionable move, but it works for now.

# List of all the files to be created during install, as absolute paths
inst_progs = $(addprefix $(TARGET)$(PREFIX)/bin/,$(bins))
inst_hosts = $(addprefix $(TARGET)$(HOSTS)/,$(hosts))
inst_man   = $(addprefix $(TARGET)$(PREFIX)/share/man/,$(mans))
inst_trans = $(patsubst locale/%,$(TARGET)$(TEXTDOMAINDIR)/%,$(out_po))
# And now, the 'install' target, depending on all of those files
install: PHONY all $(inst_progs) $(inst_hosts) $(inst_man) $(inst_trans)
# Except that listing all the files in lib would be a pain, so just cp -r it
	install -dm755 $(TARGET)$(LIBDIR)/
	cp -rfv lib/* $(TARGET)$(LIBDIR)/
	install -dm755 $(TARGET)$(CONTRIB)/
	cp -rfv contrib/* $(TARGET)$(CONTRIB)/
# Correctly set the permissions
	find $(TARGET)$(LIBDIR)/ $(TARGET)$(CONTRIB)/ | while read _f; do \
		chmod u+w "$${_f}"; \
		chmod g-w "$${_f}"; \
		chmod o=g "$${_f}" ; \
	done

# Actual make rules ############################################################

# Reemplazar todas las variables en los .in y pasarlas a los .out
%.out: %.in
	sed -e "s/@NETWORK@/$(NETWORK)/g" \
	    -e "s,@LIBDIR@,$(LIBDIR),g" \
	    -e "s,@DOC@,$(DOC),g" \
	    -e "s,@CONTRIB@,$(CONTRIB),g" \
	    -e "s,@HOSTS@,$(HOSTS),g" \
	    -e "s,@BEADLE@,$(BEADLE),g" \
	    -e "s,@TINC@,$(TINC),g" \
	    -e "s,@LVPN@,$(LVPN),g" \
	    -e "s/@FLAGS@/$(FLAGS)/g" \
	    -e "s/@KEYSIZE@/$(KEYSIZE)/g" \
	    -e "s/@PORT@/$(PORT)/g" \
	    -e "s,@SUBNET@,$(SUBNET),g" \
	    -e "s,@SUBNET6@,$(SUBNET6),g" \
	    -e "s,@TEXTDOMAINDIR@,$(TEXTDOMAINDIR),g" \
	    -e "s/@TEXTDOMAIN@/$(TEXTDOMAIN)/g" \
	    '$<' > '$@'
$(TARGET)$(PREFIX)/bin/%: %.out
	install -Dm755 '$<' '$@'

# How to generate man pages
%.1: %.markdown
	pandoc --standalone \
	       --output='$@' \
	       --to=man \
	       '$<'
# How to install man pages. We have to loop over the supported languages to
# create a rule for each language.
$(foreach lang,$(langs),$(eval \
$$(TARGET)$$(PREFIX)/share/man/$(patsubst en,.,$(lang))/man1/%.1: doc/$(lang)/%.1; \
	install -Dm644 '$$<' '$$@' \
))

# Gettext translation files
%.mo: %.po
	msgfmt -o '$@' '$<'
$(TARGET)$(TEXTDOMAINDIR)/%/LC_MESSAGES/$(TEXTDOMAIN).mo: locale/%/LC_MESSAGES/$(TEXTDOMAIN).mo
	install -Dm644 '$<' '$@'

# Host configuration files
$(TARGET)$(HOSTS)/%: hosts/%
	install -Dm644 '$<' '$@'

# Boilerplate ##################################################################

# You might have noticed that all of the targets that aren't actually files
# depend on 'PHONY'.  This declares them as phony targets to make; it says
# "don't look at the filesystem for this on, it's a high-level rule, not a file"
# GNU Make does this by having a special target, '.PHONY' which you set to
# depend on all of your phony targets.  I don't think that's very elegant.
# Because anything depending on a phony target becomes a phony target itself,
# I like to declare one phony target to make, 'PHONY', and have the rest of my
# phony targets depend on it.
PHONY:
.PHONY: PHONY
