module ActivePath
  module ViewInjection
    module Configuration
      class Attachment
        attr_reader :partial, :conditions

        def initialize(partial)
          @partial = partial
          @conditions = []
        end

        def when(condition = nil, &block)
          @conditions << (condition || block)
          self
        end
      end
    end
  end
end