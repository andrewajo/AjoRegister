module AjoRegister
  class Engine < ::Rails::Engine
    isolate_namespace AjoRegister
    config.autoload_paths << File.expand_path("../lib/generators", __FILE__)
    paths["config/locales"]
  end
end
