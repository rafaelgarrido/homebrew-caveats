#:  * `caveats`
#:  Provides installation caveat descriptions from formulae
#:
#:  `brew cask caveats` <formula1> <formula2> <...>

module Cask
  class Cmd
    class Caveats < AbstractCommand

      def initialize(*)
        super
        raise CaskUnspecifiedError if args.empty?
      end

      def run
        casks.each do |cask|
          odebug "Getting caveats for Cask #{cask}"
          self.class.caveats(cask)
        end
      end

      def self.help
        "displays caveats about the given Casks"
      end

      def self.caveats(cask)
        unless cask.caveats.empty?
          ohai "#{cask}: Caveats", cask.caveats
          puts
        end
      end

    end
  end
end