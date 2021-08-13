class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :user, presence: true
  validates :question, presence: true

end
