NAME=cfengine
VERSION=3.5.3
REVISION=elf1
UPSTREAM_FILENAME=$(NAME)-$(VERSION).tar.gz
# $@ will evaluate to $(UPSTREAM_FILENAME)
SOURCE=https://cfengine.com/source-code/download?file=$@
DEPENDS=libxml2 mysql-client openssl pcre postgresql91-client tokyocabinet

CONFIGURE_OPTIONS=--enable-static --with-libxml2=/opt/local

MANIFEST_IN=manifests
MANIFEST_OUT=proto_root/var/svc/manifest/application/management/cfengine
xml:=$(wildcard manifests/*.xml)
manifests:=$(patsubst $(MANIFEST_IN)/%,$(MANIFEST_OUT)/%,${xml})
POST_TARGET=$(manifests)

include ../lib/Makefile.mk

$(MANIFEST_OUT)/%.xml: $(MANIFEST_IN)/%.xml proto_root
	@mkdir -p $(MANIFEST_OUT)
	cp $< $@
