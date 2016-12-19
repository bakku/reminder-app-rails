class RemindersController < ApplicationController
  include UserAuthentication

  before_action :authenticate_user!

  def index
    puts current_user
    render json: Reminder.all
  end
end
