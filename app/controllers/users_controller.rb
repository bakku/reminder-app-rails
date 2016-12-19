class UsersController < ApplicationController
  include UserAuthentication

  before_action :authenticate_admin!, only: [:index]   
  before_action :authenticate_user!, except: [:index]

  def index
    render json: User.all
  end
end
