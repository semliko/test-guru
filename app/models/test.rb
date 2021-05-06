class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  class << self
    def sort_by_category(category_title)
      joins('JOIN categories ON tests.category_id = categories.id')
        .where('categories.title' => category_title)
        .order('tests.id DESC')
    end
  end
end
