class Reminder < ApplicationRecord
  belongs_to :user

  def self.ignored_fields
    [:id, :user_id, :created_at, :updated_at]
  end
end
