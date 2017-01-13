class UsersController < ApplicationController
  include UserAuthentication
   
  protect_from_forgery with: :null_session

  before_action :authenticate_user!, only: [:index, :show, :delete]

  def index
    user_must_be_admin!

    render json: User.all
  end

  def show
  end

  def create
    if user = User.create(user_params)
      render nothing: true, status: :created, location: user_show_path(user)
    else
      head :bad_request
    end
  end

  def delete
    user_must_have_current_id!
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
    if current_user.id != params[:id]
      head :forbidden
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
