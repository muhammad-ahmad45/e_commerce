class Product < ApplicationRecord

  paginates_per 1

  has_one_attached :image
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  validates :title, :description, :price, :total_quantity, :quantity_in_stock, :image, presence: true

  def self.search(attributes)
    if attributes[:price].present? && attributes[:quantity].present?
      value = Product.where('price = :price AND total_quantity = :quantity', price: attributes[:price].to_f,
          quantity: attributes[:quantity].to_i)
    elsif attributes[:price].present? || attributes[:quantity].present?
      value = Product.where('price = :price OR total_quantity = :quantity', price: attributes[:price].to_f,
          quantity: attributes[:quantity].to_i)
    else
      value = Product.all
    end
    value
  end

end
