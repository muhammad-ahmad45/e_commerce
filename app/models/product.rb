class Product < ApplicationRecord

  paginates_per 3

  has_one_attached :image
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  validates :title, :description, :price, :total_quantity, :quantity_in_stock, presence: true

end
