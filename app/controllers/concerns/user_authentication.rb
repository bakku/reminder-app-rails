module UserAuthentication
  include ActionController::HttpAuthentication::Basic

  def current_user
    @user 
  end

  def authenticate_user!
    authenticate!
  end

  def authenticate!
    realm = 'Application'
    message = 'Access denied'

    @user = authenticate_or_request_with_http_basic(realm, message) do |email, password|
      user = User.find_by(email: email)  

      unless user.present? && user.password == Digest::SHA512.hexdigest(password)
        ActionController::HttpAuthentication::Basic.authentication_request(self, realm, message) 
      end

      user
    end
  end

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
end
