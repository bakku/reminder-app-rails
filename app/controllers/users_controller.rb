class UsersController < ApplicationController
  include UserAuthentication

  before_action :authenticate_user!, only: [:index, :show, :delete]

  def index
    user_must_be_admin!

    render json: User.all
  end

  def show
    if current_user.id != params[:id] 
    end
  end

  def create

  end

  def delete
  end

  private

  def user_must_be_admin!
    if current_user.is_admin == false
      head :forbidden
    end
  end
end
