NAME=cfengine
VERSION=3.6.4
REVISION=elf2
UPSTREAM_FILENAME=$(NAME)-$(VERSION).tar.gz
# $@ will evaluate to $(UPSTREAM_FILENAME)
SOURCE=https://s3.amazonaws.com/cfengine.package-repos/tarballs/$@
DEPENDS=libxml2 openssl pcre liblmdb

CONFIGURE_OPTIONS+=--with-libxml2=/opt/local
CONFIGURE_OPTIONS+=--without-postgresql --without-mysql


MANIFEST_IN=manifests
MANIFEST_OUT=proto_root/var/svc/manifest/application/management/cfengine
xml:=$(wildcard manifests/*.xml)
manifests:=$(patsubst $(MANIFEST_IN)/%,$(MANIFEST_OUT)/%,${xml})
POST_TARGET=$(manifests)

include ../lib/Makefile.mk

$(MANIFEST_OUT)/%.xml: $(MANIFEST_IN)/%.xml proto_root
	@mkdir -p $(MANIFEST_OUT)
	cp $< $@
