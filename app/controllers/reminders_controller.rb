class RemindersController < ApplicationController
  before_action :produces_json   

  def index
    head :ok
  end

  private

  def produces_json
    request.format = :json
  end
end
