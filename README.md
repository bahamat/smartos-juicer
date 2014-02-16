These are scripts that I use to build supplemental packages for [SmartOS][smartos].
Hopefully this will never grow too large.

See the current release information for [`pkgsrc`][pkgsrc]

You first need to install git, naturally. Then run clone and run `bmake`.

    /opt/local/bin/pkgin -y install scmgit-base
    git clone https://github.com/bahamat/smartos-juicer
    cd smartos-juicer; bmake

Within each package directory, simply run `make` to create a SmartOS package.

For creating your own new packages:

1. `cp -r skeleton` to your new package name.
2. Edit the `Makefile` as necessary.
3. Run `make`.

**Note:** I am not officially or unoffically involved with SmartOS in any way.
I merely use it privately. Nothing in this repository is to be considered a
"contribution" to SmartOS.

The basic procedure for this was adapted from [Creating local SmartOS Packages][smartos-pkgs] and [pkgssrc Binary Packages for Illumos][pkgsrc-for-illumos] by Jonathan Perkins.

[smartos]: http://smartos.org/
[pkgsrc]: http://www.perkin.org.uk/posts/whats-new-in-pkgsrc-2013Q2.html
[smartos-pkgs]: http://www.perkin.org.uk/posts/creating-local-smartos-packages.html
[pkgsrc-for-illumos]: http://www.perkin.org.uk/pages/pkgsrc-binary-packages-for-illumos.html
