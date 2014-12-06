CURL=/opt/local/bin/curl
CURLFLAGS=--location --progress-bar --output

# Environemnt Variables
export CPPFLAGS=-I/opt/local/include
export LDFLAGS=-L/opt/local/lib -R/opt/local/lib
export DESTDIR=$(PWD)/proto_root

PACKAGE=$(NAME)-$(VERSION)$(REVISION).tgz
SRCDIR?=$(NAME)-$(VERSION)

all: $(PACKAGE)

dep:
	pkgin -y update
	pkgin -y install $(DEPENDS)

$(UPSTREAM_FILENAME):
	$(CURL) $(CURLFLAGS) $@ "$(SOURCE)"

$(SRCDIR): $(UPSTREAM_FILENAME)
	tar zxf $<

$(SRCDIR)/config.status: $(SRCDIR)
	cd $< ; ./configure $(CONFIGURE_OPTIONS)
	gmake -C $<
	@touch $<
	@touch $@

proto_root: $(SRCDIR)/config.status
	gmake -C $(SRCDIR)  install
	@touch $<
	@touch $@

packlist: proto_root $(POST_TARGET)
	( cd $< ; find . -type f -or -type l | sort ) > $@

$(PACKAGE): packlist comment description
	pkg_create -B ../build-info -I / -c comment -d description -f packlist -P "$(DEPENDS)" -p proto_root -U $@

clean:
	$(RM) -r $(SRCDIR) proto_root packlist

distclean: clean
	$(RM) -r $(UPSTREAM_FILENAME) $(PACKAGE)
