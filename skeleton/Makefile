NAME=name
VERSION=1.2.3
REVISION=elf1
UPSTREAM_FILENAME=$(NAME)-$(VERSION).tar.gz
# $@ will evaluate to $(UPSTREAM_FILENAME)
SOURCE=https://example.com/download/$@
DEPENDS=openssl pcre libxml2

CONFIGURE_OPTIONS=--enable-static --with-libxml2=/opt/pkg

include ../lib/Makefile.mk
