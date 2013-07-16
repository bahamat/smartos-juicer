NAME=name
VERSION=1.2.3
EXT=tar.gz
# $@ will evaluate to $(NAME)-$(VERSION).$(EXT)
SOURCE=https://example.com/download/$@
DEPENDS=openssl pcre libxml2

CONFIGURE_OPTIONS=--enable-static --with-libxml2=/opt/pkg

include ../lib/Makefile.mk
