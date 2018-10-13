require 'formula'

class BrewCaveats < Formula
  url 'git://github.com/rafaelgarrido/homebrew-caveats.git'
  homepage 'https://github.com/rafaelgarrido/homebrew-caveats'
  version '0.0.7'

  skip_clean 'bin'

  def install
    bin.install 'cmd/brew-caveats.rb'
    bin.install 'cmd/brewcask-caveats.rb'
    (bin+'brew-caveats.rb').chmod 0755
    (bin+'brewcask-caveats.rb').chmod 0755
  end

end
