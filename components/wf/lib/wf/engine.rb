module Wf
  class Engine < ::Rails::Engine
    isolate_namespace Wf
    config.generators.api_only = true
  end
end
