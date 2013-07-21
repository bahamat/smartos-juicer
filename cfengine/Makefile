NAME=cfengine
VERSION=3.4.5
REVISION=elf1
UPSTREAM_FILENAME=$(NAME)-$(VERSION).tar.gz
# $@ will evaluate to $(NAME)-$(VERSION).$(EXT)
SOURCE=https://cfengine.com/source-code/download?file=$@
DEPENDS=openssl pcre libxml2 tokyocabinet

CONFIGURE_OPTIONS=--enable-static --with-libxml2=/opt/local

include ../lib/Makefile.mk
