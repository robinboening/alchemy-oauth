require 'alchemy_cms'

module Alchemy
  module Oauth
    class Engine < ::Rails::Engine
      isolate_namespace Alchemy
      engine_name 'alchemy_oauth'

      # we need to reload the routes or else the prepended doorkeeper routes will not work
      config.to_prepare do
        Rails.application.reload_routes!
      end
    end
  end
end
