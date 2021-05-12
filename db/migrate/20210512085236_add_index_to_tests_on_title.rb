class AddIndexToTestsOnTitle < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, :title, unique: true
  end
end
