require 'formula'

class BrewCaveats < Formula
  url 'git://github.com/rafaelgarrido/homebrew-caveats.git'
  homepage 'https://github.com/rafaelgarrido/homebrew-caveats'
  version '0.0.3'

  def install
    bin.install 'brew-caveats.rb'
    (bin+'brew-caveats.rb').chmod 0755
  end

end
