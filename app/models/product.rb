class Product < ApplicationRecord
  belongs_to :trader, dependent: :destroy
  validates :name, presence: true
  validates :num, presence: true,  numericality: { greater_than: 0 }
  validates :price, presence: true,  numericality: { greater_than: 0 }
end
