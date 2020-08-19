class ReactorJob < ApplicationJob
  # queue_as :default

  def perform(event, reactor_class)
    reactor = reactor_class.constantize

    reactor.call(event)
  end
end
