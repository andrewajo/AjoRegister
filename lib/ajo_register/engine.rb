module AjoRegister
  class Engine < ::Rails::Engine
    config.autoload_paths << File.expand_path("../lib/generators", __FILE__)
    paths["config/locales"]
  end
end
