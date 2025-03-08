# typed: strict
# frozen_string_literal: true

require "abstract_command"
require "caveats"
require "formula"
require "missing_formula"

module Homebrew
  module Cmd
    class CaveatsCmd < AbstractCommand

      cmd_args do
        usage_banner "`caveats` <formulae1> <formulae2> ..."
        description <<~EOS
          Provides installation caveat descriptions from formulae and casks.
        EOS

        switch "--formula", "--formulae",
               description: "Treat all named arguments as formulae."
        switch "--cask", "--casks",
               description: "Treat all named arguments as casks."

        conflicts "--formula", "--cask"

        named_args [:formula, :cask], min: 1
      end

      sig { override.void }
      def run
        args.named.to_formulae_and_casks_and_unavailable.each_with_index do |obj, i|
          puts unless i.zero?

          case obj
          when Formula
            puts_formula_caveats(obj)
          when Cask::Cask
            puts_cask_caveats(obj)
          when FormulaOrCaskUnavailableError
            # The formula/cask could not be found
            ofail obj.message
            # No formula with this name, try a missing formula lookup
            if (reason = MissingFormula.reason(obj.name, show_info: true))
              $stderr.puts reason
            end
          else
            raise
          end
        end
      end

      def puts_formula_caveats(f)
        c = Caveats.new(f)
        unless c.empty?
          ohai "#{f.full_name}: Caveats", c.to_s
          puts
        end
      end
      
      def puts_cask_caveats(cask)
        unless cask.caveats.empty?
          ohai "#{cask}: Caveats", cask.caveats
          puts
        end
      end

    end
  end
end
