#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew uninstall bash-completion
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install go
brew install pixman
brew install autoconf
brew install icu4c
brew install pkg-config
brew install autojump
brew install jpeg
brew install postgresql
brew install automake
brew install jpeg-turbo
brew install python
brew install bazaar
brew install libevent
brew install qemu
brew install boot2docker
brew install libffi
brew install qt
brew install brew-cask
brew install libgpg-error
brew install qt5
brew install cmake
brew install libpng
brew install rbenv
brew install couchdb
brew install libssh2
brew install rbenv-binstubs
brew install cscope
brew install libtasn1
brew install rbenv-bundler
brew install csshx
brew install libtiff
brew install rbenv-gem-rehash
brew install ddclient
brew install libtool
brew install rbenv-gemset
brew install docker
brew install libxml2
brew install readline
brew install dos2unix
brew install libxslt
brew install ruby-build
brew install ec2-ami-tools
brew install libyaml
brew install s-lang
brew install ec2-api-tools
brew install spidermonkey
brew install erlang
brew install mercurial
brew install sqlite
brew install fish
brew install midnight-commander
brew install the_silver_searcher
brew install fltk
brew install mysql
brew install tiger-vnc
brew install fortune
brew install nasm
brew install tin
brew install gdbm
brew install nettle
brew install tmux
brew install gettext
brew install nmap
brew install tree
brew install git
brew install nspr
brew install unixodbc
brew install glib
brew install openssl
brew install wget
brew install gmp
brew install ossp-uuid
brew install wxmac
brew install gnutls
brew install pcre
brew install xz

# Remove outdated versions from the cellar.
brew cleanup
