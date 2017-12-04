class Course < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :students

  validates :name, presence: true, length: { in: 3..50 }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 3}
  validates :category_id, presence: true
  validates :name, uniqueness: { scope: [:level, :category_id] }
end
