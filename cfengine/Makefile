NAME=cfengine
VERSION=3.4.5
EXT=tar.gz
# $@ will evaluate to $(NAME)-$(VERSION).$(EXT)
SOURCE=https://cfengine.com/source-code/download?file=$@
DEPENDS=openssl pcre libxml2

CONFIGURE_OPTIONS=--enable-static --with-libxml2=/opt/pkg

include ../lib/Makefile.mk
