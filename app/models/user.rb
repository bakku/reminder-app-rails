class User < ApplicationRecord
  before_save :hash_password

  def admin?
    self.role == 'admin'
  end

  def customer?
    self.role == 'customer'
  end

  private

  def hash_password
    self.password = Digest::SHA512.hexdigest(self.password)
  end
end
