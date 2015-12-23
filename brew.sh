#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
# Install zsh.
brew install zsh
brew install zsh-completions
brew install zsh-history-substring-search
brew tap homebrew/versions


# Install Hombrebrew Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install tmux

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install nmap
brew install socat
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ngrep
brew install osquery
brew install xz

# Install other useful binaries.
brew install git
brew install git-lfs
brew install hub
brew install tig
brew install ctags
brew install imagemagick --with-webp
brew install pv
brew install tree
brew install zopfli
brew install fpp
brew install kafkacat
brew install autojump
brew install jq
brew install htop
brew install ack
brew install the_silver_searcher
brew install httpie

# Install support for Elixir, Go, Node, etc
brew install elixir
brew install go
brew install node
brew install leiningen

# Install cask applications
brew install cask heroku-toolbelt virtualbox dockertoolbox dash vlc spotify atom sublime-text3

# Remove outdated versions from the cellar.
brew cleanup
