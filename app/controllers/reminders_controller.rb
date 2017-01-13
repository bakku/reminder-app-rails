class RemindersController < ApplicationController
  include UserAuthentication

  protect_from_forgery with: :null_session

  # authentication
  before_action :authenticate_user!

  # authorization
  before_action :user_must_have_current_id!

  def index
    render json: Reminder.where(user_id: params[:id]).as_json(except: Reminder.ignored_fields)
  end

  def create
    reminder = Reminder.new(reminder_params)
    reminder.user_id = params[:id]

    if reminder.save
      reminder.reload
      render nothing: true, status: :created, location: reminder_show_path(current_user.id, reminder.id)
    else
      head :bad_request
    end
  end

  def show
    render json: Reminder.find(params[:reminder_id]).as_json(except: Reminder.ignored_fields)
  end

  def delete
    Reminder.destroy(params[:reminder_id])
    head :ok
  end

  private

  def reminder_params
    params.require(:reminder).permit(:message, :reminder_date)
  end

end
