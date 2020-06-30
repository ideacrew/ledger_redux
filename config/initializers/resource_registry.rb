# Initializer file created by Resource Registry
app_name = Rails.application.class.parent_name
registry_name = "#{app_name}Registry"
Object.const_set(registry_name, ResourceRegistry::Registry.new)

registry = registry_name.constantize
app_key  = app_name.underscore.to_sym

registry.db_connection = ::ActiveRecord::Base.connection

registry.configure do |config|
  config.name       = app_key
  config.created_at = DateTime.now
  config.load_path  = Rails.root.join('system', 'config', 'features').to_s
end

if registry.feature_enabled?(:boot)
  services = registry.features_by_namespace('system.services')
  services.each do |service|
    service_feature = registry[service]
    if service_feature.enabled?
      feature = registry[:boot] { service_feature.key }
      if feature.success?
        registry.register_feature(feature.value!)
      else
        feature.failure
      end
    end
  end
end
