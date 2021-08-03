class Book < ApplicationRecord
  has_one_attached :image
  attribute :new_image
  validates :title, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :read_date, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  before_save do
    self.image = new_image if new_image
  end
end
