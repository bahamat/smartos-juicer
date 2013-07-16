These are scripts that I use to build supplemental packages for [SmartOS][smartos].
Hopefully this will never grow too large.

You first need to install git, naturally. Then run clone and run `bmake`.

    /opt/local/bin/pkgin -y install scmgit-base
    git clone https://github.com/bahamat/smartos-juicer
    cd smartos-juicer; bmake

**Note:** I am not officially or unoffically involved with SmartOS in any way.
I merely use it privately. Nothing in this repository is to be considered a
"contribution" to SmartOS.

[smartos]: http://smartos.org/
