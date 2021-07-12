class DropTableTestsUsers < ActiveRecord::Migration[6.1]
  def up
    drop_table :tests_users, if_exist: true
  end

  def down; end
end
