NAME=cfengine
VERSION=3.4.5
REVISION=elf2
UPSTREAM_FILENAME=$(NAME)-$(VERSION).tar.gz
# $@ will evaluate to $(UPSTREAM_FILENAME)
SOURCE=https://cfengine.com/source-code/download?file=$@
DEPENDS=libxml2 mysql-client openssl pcre postgresql91-client tokyocabinet

CONFIGURE_OPTIONS=--enable-static --with-libxml2=/opt/local

include ../lib/Makefile.mk
