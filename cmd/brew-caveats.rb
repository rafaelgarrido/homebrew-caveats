#:  * `caveats`
#:  Provides installation caveat descriptions from formulae
#:
#:  `brew caveats` <formula1> <formula2> <...>

require "cli/parser"
require 'formula'
require 'caveats'

module Homebrew extend self

  def caveats_args
    Homebrew::CLI::Parser.new do
      usage_banner <<~EOS
        `caveats` <formulae1> <formulae2> <...>
        Provides installation caveat descriptions from formulae`.
      EOS
    end
  end

  def caveats
    args = caveats_args.parse
    raise FormulaUnspecifiedError if args.named.empty?

    args.named.each do |f|
      puts_caveats Formulary.factory(f) rescue nil
    end
  end

  def puts_caveats f
    c = Caveats.new(f)
    unless c.empty?
      ohai "#{f.full_name}: Caveats", c.caveats
      puts
    end
  end
end

Homebrew.caveats
