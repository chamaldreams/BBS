class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def change
  add_column :users, :confirmation_token, :string #generate token for confirm
  add_column :users, :confirmed_at, :datetime #keep datetime when user activate
  add_column :users, :confirmation_sent_at, :datetime #keep datetime when sent confirm email
  add_index :users, :confirmation_token, unique: true #define confirmation token is unique
  

  end
end
