all: dep build-info

dep:
	pkgin -y update
	pkgin -y install gcc47 gmake

build-info:
	pkg_info -X pkg_install | egrep '^(MACHINE_ARCH|OPSYS|OS_VERSION|PKGTOOLS_VERSION)' >build-info

clean:
	$(RM) build-info
