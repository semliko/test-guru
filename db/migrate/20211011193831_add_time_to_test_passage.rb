class AddTimeToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :start_time, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    add_column :test_passages, :end_time, :datetime
    add_column :test_passages, :deadline_time, :datetime
  end
end
