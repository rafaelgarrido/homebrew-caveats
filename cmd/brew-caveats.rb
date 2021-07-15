#:  * `caveats`
#:  Provides installation caveat descriptions from formulae
#:
#:  `brew caveats` <formula1> <formula2> <...>

require "caveats"
require "cli/parser"
require "formula"

module Homebrew
  extend T::Sig

  module_function

  sig { returns(CLI::Parser) }
  def caveats_args
    Homebrew::CLI::Parser.new do
      description <<~EOS
        `caveats` <formulae1> <formulae2> <...>
        Provides installation caveat descriptions from formulae and casks`.
      EOS

      switch "--formula", "--formulae",
             description: "Treat all named arguments as formulae."
      switch "--cask", "--casks",
             description: "Treat all named arguments as casks."
      
      conflicts "--formula", "--cask"

      named_args [:formula, :cask]
    end
  end

  sig { void }
  def caveats
    args = caveats_args.parse
    print_caveats(args: args)
  end

  sig { params(args: CLI::Args).void }
  def print_caveats(args:)
    args.named.to_formulae_and_casks_and_unavailable.each_with_index do |obj, i|
      puts unless i.zero?

      case obj
      when Formula
        puts_formula_caveats obj
      when Cask::Cask
        puts_cask_caveats obj
      when FormulaOrCaskUnavailableError
        ofail obj.message
        # No formula with this name, try a missing formula lookup
        if (reason = MissingFormula.reason(obj.name, show_info: false))
          $stderr.puts reason
        end
      else
        raise
      end
    end
  end

  def puts_formula_caveats f
    c = Caveats.new(f)
    unless c.empty?
      ohai "#{f.full_name}: Caveats", c.to_s
      puts
    end
  end
  
  def puts_cask_caveats cask
    unless cask.caveats.empty?
      ohai "#{cask}: Caveats", cask.caveats
      puts
    end
  end
end

Homebrew.caveats
