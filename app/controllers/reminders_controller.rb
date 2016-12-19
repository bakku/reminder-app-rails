class RemindersController < ApplicationController
  include UserAuthentication

  before_action :authenticate_user!

  def index
    render json: Reminder.all
  end
end
