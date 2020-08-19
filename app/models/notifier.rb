class Notifier
  include Acapi::Notifiers

  def self.call(event, payload)
    notify(event, payload)
  end
end
