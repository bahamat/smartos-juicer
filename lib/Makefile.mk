# Environemnt Variables
export CPPFLAGS=-I/opt/local/include
export LDFLAGS=-L/opt/local/lib -R/opt/local/lib
export DESTDIR=$(PWD)/proto_root

PACKAGE=$(NAME)-$(VERSION)$(REVISION).tgz

all: $(PACKAGE)

dep:
	pkgin -y update
	pkgin -y install $(DEPENDS)

$(UPSTREAM_FILENAME):
	curl --progress-bar --output $@ "$(SOURCE)"

$(NAME)-$(VERSION): $(UPSTREAM_FILENAME)
	tar zxf $<

$(NAME)-$(VERSION)/config.status: $(NAME)-$(VERSION)
	cd $< ; ./configure $(CONFIGURE_OPTIONS)
	gmake -C $<
	@touch $<
	@touch $@

proto_root: $(NAME)-$(VERSION)/config.status
	gmake -C $(NAME)-$(VERSION) install
	@touch $<
	@touch $@

packlist: proto_root
	( cd $< ; find . -type f -or -type l | sort ) > $@

$(PACKAGE): packlist comment description $(POST_TARGET)
	pkg_create -B ../build-info -I / -c comment -d description -f packlist -P "$(DEPENDS)" -p proto_root -U $@

clean:
	$(RM) -r $(NAME)-$(VERSION) proto_root packlist

mrclean: clean
	$(RM) -r $(UPSTREAM_FILENAME) $(PACKAGE)
