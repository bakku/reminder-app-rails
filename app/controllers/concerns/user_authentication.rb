module UserAuthentication
  include ActionController::HttpAuthentication::Basic

  def current_user
    @user 
  end

  def authenticate_user!
    realm = 'Application'
    message = 'Access denied'

    authenticate_or_request_with_http_basic(realm, message) do |email, password|
      @user = User.find_by(email: email)  

      unless @user.present? && @user.password == Digest::SH512.hexdigest(password)
        ActionController::HttpAuthentication::Basic.authentication_request(self, realm, message) 
      end
    end
  end
end
