class AddDurationToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :duration, :string, default: "00:30"
  end
end
