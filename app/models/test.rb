class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_and_belongs_to_many :users
  scope :by_level, ->(level) { where(level: level) }
  scope :simple_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :difficult_level, -> { where(level: 5..Float::INFINITY) }
  scope :join_with_categories, -> { joins('JOIN categories ON tests.category_id = categories.id') }
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  class << self
    def sort_by_category(category_title)
      join_with_categories
        .where('categories.title' => category_title)
        .order('categories.title ASC')
    end
  end
end
