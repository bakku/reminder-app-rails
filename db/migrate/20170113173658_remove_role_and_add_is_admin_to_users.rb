class RemoveRoleAndAddIsAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :role
    add_column :users, :is_admin, :boolean, default: false
  end
end
