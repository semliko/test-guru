class Test < ApplicationRecord
  belongs_to :category
  has_many :questins
  has_and_belongs_to_many :users
end
