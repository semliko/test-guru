class Category < ApplicationRecord
  has_many :tests
  scope :ordered_by_name, -> { order('title ASC') }
end
