require 'active_path/view_injection/configuration/attachment'
module ActivePath
  module ViewInjection
    module Configuration
      class Partial
        attr_reader :attachments

        def initialize
          @attachments = []
        end

        def with(partial_name)
          @attachments << Attachment.new(partial_name)
          @attachments.last
        end
      end
    end
  end
end