class UsersController < ApplicationController
  include UserAuthentication
   
  protect_from_forgery with: :null_session

  # authentication
  before_action :authenticate_user!, only: [:index, :show, :delete]

  # authorization
  before_action :user_must_be_admin!, only: [:index]
  before_action :user_must_have_current_id!, only: [:show, :delete]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    if user = User.create(user_params)
      render nothing: true, status: :created, location: user_show_path(user)
    else
      head :bad_request
    end
  end

  def delete
    User.destroy(params[:id])
    head :ok
  end

  private

  def user_must_be_admin!
    if current_user.is_admin == false
      head :forbidden
    end
  end

  def user_must_have_current_id!
    if current_user.id != params[:id].to_i && current_user.is_admin == false
      head :forbidden
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
