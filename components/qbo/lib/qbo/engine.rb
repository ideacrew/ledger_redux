require 'faraday_middleware'
require 'qbo_api'

module Qbo
  class Engine < ::Rails::Engine
    isolate_namespace Qbo

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

  end
end
