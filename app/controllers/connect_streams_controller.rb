class ConnectStreamsController < FatFreeCrm::ApplicationController
	before_action :authenticate_user!
	layout false, :only => [:connect]

  def connect
  	@phone_number = params[:phone_number]
  end
end
