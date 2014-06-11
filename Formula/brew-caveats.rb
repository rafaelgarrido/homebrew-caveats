require 'formula'

class BrewCaveats < Formula
  url 'git://github.com/rafaelgarrido/homebrew-caveats.git'
  homepage 'https://github.com/rafaelgarrido/homebrew-caveats'
  version '0.0.2'

  def install
    bin.install 'bin/brew-caveats'
  end

end
