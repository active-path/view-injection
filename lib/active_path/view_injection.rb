require 'active_path/view_injection/engine'
module ActivePath
  def self.prepend(partial)
    config.partials.prepend(partial)
  end
  def self.append(partial)
    config.partials.append(partial)
  end
end