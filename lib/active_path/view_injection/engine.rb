require 'active_path/view_injection/configuration/partials'
require 'active_path/view_injection/subscriber'
module ActivePath
  module ViewInjection
    class Engine < Rails::Engine
      isolate_namespace ActivePath::ViewInjection

      config.before_configuration do
        config.active_path.partials = Configuration::Partials.new
      end

      config.after_initialize do
        ActiveSupport::Notifications.subscribe(:render_partial, Subscriber.new)
      end
    end
  end
end
