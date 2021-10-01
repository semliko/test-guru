class AddBadgeCategoryToBadges < ActiveRecord::Migration[6.1]
  def change
    add_reference :badges, :badge_category, null: false, foreign_key: true
  end
end
