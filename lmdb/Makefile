NAME=liblmdb
VERSION=0.9.11
REVISION=elf1
LOCAL_FILENAME=$(NAME)-$(VERSION).tar.gz
UPSTREAM_FILENAME=aa3463ec7c5e979420b13c8f37caa377ed2c1cf1.tar.gz
SOURCE=https://gitorious.org/mdb/mdb/archive/$(UPSTREAM_FILENAME)

SOURCE_DIR=mdb-mdb/libraries/liblmdb
LIBLMDB_SO=mdb-mdb/libraries/liblmdb/liblmdb.so

prefix=/opt/local

PACKAGE=$(NAME)-$(VERSION)$(REVISION).tgz

# Environemnt Variables
export CPPFLAGS=-I/opt/local/include
export LDFLAGS=-L/opt/local/lib -R/opt/local/lib
export DESTDIR=$(PWD)/proto_root

all: $(PACKAGE)

$(LOCAL_FILENAME):
	curl --location --progress-bar --output $@ "$(SOURCE)"

$(SOURCE_DIR): $(LOCAL_FILENAME)
	tar zxf $<
	patch -p 0 < $(NAME)-$(VERSION)$(REVISION).patch

$(LIBLMDB_SO): $(SOURCE_DIR)
	make -C $<

proto_root: $(LIBLMDB_SO)
	mkdir -p $@/$(prefix)/bin/
	mkdir -p $@/$(prefix)/lib/
	mkdir -p $@/$(prefix)/include/
	mkdir -p $@/$(prefix)/man/man1/
	make -C $(SOURCE_DIR) install
	@touch $<
	@touch $@

packlist: proto_root
	( cd $< ; find . -type f -or -type l | sort ) > $@

$(PACKAGE): packlist comment description
	pkg_create -B ../build-info -I / -c comment -d description -f packlist -P "$(DEPENDS)" -p proto_root -U $@

clean:
	$(RM) -r mdb-mdb proto_root packlist

mrclean: clean
	$(RM) -r $(LOCAL_FILENAME) $(PACKAGE)
