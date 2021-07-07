class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_and_belongs_to_many :users
  scope :by_level, ->(level) { where(level: level) }
  scope :simple_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :difficult_level, -> { where(level: 5..Float::INFINITY) }
  scope :join_with_categories, lambda { |category_title|
                                 joins('JOIN categories ON tests.category_id = categories.id').where('categories.title' => category_title)
                               }
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  class << self
    def titles_by_category(category_title)
      join_with_categories(category_title)
        .order('categories.title ASC').pluck(:title)
    end
  end
end
