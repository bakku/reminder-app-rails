class User < ApplicationRecord
  before_save :hash_password
  has_many :reminders

  def self.ignored_fields
    [:id, :password, :created_at, :updated_at, :is_admin]
  end

  private

  def hash_password
    self.password = Digest::SHA512.hexdigest(self.password)
  end
end
