class ConfigurationsController < ApplicationController
  layout 'main'

  def index
  end


  def update
    @feature = ResourceRegistry::Operations::Features::Update.new.call({feature: feature_params(params), registry: CovidMostRegistry})

    respond_to do |format|
      format.js
    end
  end

  private

  def feature_params(params)
    params.require('feature').permit(:key, :is_enabled, settings:  {})
  end
end
