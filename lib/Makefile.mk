# Environemnt Variables
export CPPFLAGS=-I/opt/local/include
export LDFLAGS=-L/opt/local/lib -R/opt/local/lib
export DESTDIR=$(PWD)/proto_root

all: proto_root

dep:
	pkgin -y update
	pkgin -y install $(DEPENDS)

$(NAME)-$(VERSION).$(EXT):
	curl -o $@ "$(SOURCE)"

$(NAME)-$(VERSION): $(NAME)-$(VERSION).$(EXT)
	tar zxf $<
	cd $@ ; ./configure $(CONFIGURE_OPTIONS)
	gmake -C $@

proto_root: $(NAME)-$(VERSION)
	gmake -C $< install

clean:
	$(RM) -r $(NAME)-$(VERSION)

mrclean:
	$(RM) -r $(NAME)* proto_root
