module UserAuthentication
  include ActionController::HttpAuthentication::Basic

  def current_user
    @user 
  end

  def authenticate_admin!
    authenticate!(true)
  end

  def authenticate_user!
    authenticate!
  end

  def authenticate!(user_should_be_admin=false)
    realm = 'Application'
    message = 'Access denied'

    @user = authenticate_or_request_with_http_basic(realm, message) do |email, password|
      user = User.find_by(email: email)  

      unless user.present? && user.password == Digest::SHA512.hexdigest(password)
        ActionController::HttpAuthentication::Basic.authentication_request(self, realm, message) 
      else
        if user_should_be_admin && user.admin? == false
          ActionController::HttpAuthentication::Basic.authentication_request(self, realm, message) 
        end
      end

      user
    end
  end
end
