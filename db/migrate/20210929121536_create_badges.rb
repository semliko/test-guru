class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :category, null: false
      t.string :name, null: false
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
