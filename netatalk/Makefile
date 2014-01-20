NAME=netatalk
VERSION=3.1.0
REVISION=elf1
UPSTREAM_FILENAME=$(NAME)-$(VERSION).tar.gz
# $@ will evaluate to $(UPSTREAM_FILENAME)
SOURCE=http://downloads.sourceforge.net/project/netatalk/netatalk/3.1/$@
DEPENDS=db4 libgcrypt openssl

CONFIGURE_OPTIONS+=--with-bdb=/opt/local
CONFIGURE_OPTIONS+=--with-init-style=solaris
CONFIGURE_OPTIONS+=--with-init-dir=/var/svc/manifest/network/
CONFIGURE_OPTIONS+=--without-pam
CONFIGURE_OPTIONS+=--prefix=/opt/local
CONFIGURE_OPTIONS+=--with-ssl-dir=/opt/local
CONFIGURE_OPTIONS+=--with-libgcrypt-dir=/opt/local

CONFIGURE_OPTIONS+=--disable-zeroconf
CONFIGURE_OPTIONS+=--enable-netbsd
CONFIGURE_OPTIONS+=--enable-overwrite
CONFIGURE_OPTIONS+=--enable-timelord
CONFIGURE_OPTIONS+=--enable-ddp
CONFIGURE_OPTIONS+=--enable-quota
CONFIGURE_OPTIONS+=--with-pkgconfdir=/opt/local/etc/netatalk

include ../lib/Makefile.mk
