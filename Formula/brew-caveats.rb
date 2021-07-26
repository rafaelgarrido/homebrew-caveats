require 'formula'

class BrewCaveats < Formula
  url 'git://github.com/rafaelgarrido/homebrew-caveats.git'
  desc 'Formulae Caveats Shortcut for Homebrew Package Manager'
  homepage 'https://github.com/rafaelgarrido/homebrew-caveats'
  version '0.1.0'

  skip_clean 'bin'

  def install
    bin.install 'cmd/brew-caveats.rb'
    (bin+'brew-caveats.rb').chmod 0755
  end

end
