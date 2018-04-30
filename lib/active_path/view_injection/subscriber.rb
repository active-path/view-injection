require 'active_path/view_injection/conditions/conditional'
require 'active_path/subscribers/subscriber'
module ActivePath
  module ViewInjection
    class Subscriber < Subscribers::Subscriber
      include Conditions::Conditional

      def perform
        prepend_attachments.each do |attachment|
          buffer.prepend(render_attachment(attachment))
        end

        append_attachments.each do |attachment|
          buffer.concat(render_attachment(attachment))
        end
      end

      private

      def append_attachments
        attachments(ActivePath.config.partials.append(partial))
      end

      def prepend_attachments
        attachments(ActivePath.config.partials.prepend(partial))
      end

      def attachments(configuration)
        configuration.attachments.select do |attachment|
          conditions_match?(attachment.conditions)
        end
      end

      def render_attachment(attachment)
        hash = { partial: attachment.partial }
        options_hash = options.is_a?(Hash) ? options.merge(hash) : hash
        context.render(options_hash)
      end
    end
  end
end