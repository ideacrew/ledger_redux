# Subscribes Reactors to Events.
# * `trigger` will run the Reactor synchronously
# * `async` will queue up a ReactorJob to run the Reactor
class Events::Dispatcher < Lib::EventDispatcher
  on Events::BenefitApplication::Created, async: Reactors::BenefitApplication::SendWelcomeMessage
  on Events::BenefitApplication::Created, trigger: Reactors::BenefitApplication::QboCreateCustomer
  on Events::BenefitApplication::Created, trigger: Reactors::BenefitApplication::FfcrmCreateAccount
end
