class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
    add_column :users, :customer_role, :boolean, default: false
    add_column :users, :production_role, :boolean, default: false
    add_column :users, :dealer_role, :boolean, default: false
  end
end
