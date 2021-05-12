class AddEmailToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    User.where(email: nil).update(email: '')
    change_column_null :users, :email, false
  end
end
