require 'active_path/view_injection/configuration/partial'
module ActivePath
  module ViewInjection
    module Configuration
      class Partials
        attr_reader :partials

        def initialize
          @partials = {}
        end

        def prepend(key)
          partial(key, true)
        end

        def append(key)
          partial(key, false)
        end

        private

        def partial(key, prepend = true)
          @partials["#{key}/#{prepend}"] ||= Partial.new
        end
      end
    end
  end
end