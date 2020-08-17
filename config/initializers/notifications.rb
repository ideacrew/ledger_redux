# Subscribe to RackAttack notification throttle events and send to Rails Logger
ActiveSupport::Notifications.subscribe("rack.attack") do |name, start, finish, request_id, req|
  if req[:request].env['rack.attack.match_type'] == :throttle
    Rails.logger.info "Throttled IP: #{req.ip}"
  end
end