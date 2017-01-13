class User < ApplicationRecord
  before_save :hash_password

  private

  def hash_password
    self.password = Digest::SHA512.hexdigest(self.password)
  end
end
