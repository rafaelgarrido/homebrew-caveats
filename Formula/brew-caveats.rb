require 'formula'

class BrewCaveats < Formula
  url 'git://github.com/rafaelgarrido/homebrew-caveats.git'
  homepage 'https://github.com/rafaelgarrido/homebrew-caveats'
  version '0.0.1'

  def install
    inreplace 'bin/brew-caveats', /^BREW_PREFIX = '.*'$/, "BREW_PREFIX = '#{HOMEBREW_PREFIX}'"
    bin.install 'bin/brew-caveats'
  end

end
