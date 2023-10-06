class Product < ApplicationRecord

  paginates_per 2

  has_one_attached :image
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  validates :title, :description, :price, :total_quantity, :quantity_in_stock, :image, presence: true

  def self.search(attributes)
    if attributes[:title].present? || attributes[:min_price].present? || attributes[:max_price].present?
      value = Product.where(
        'title = :title OR price <= :max_price OR price >= :min_price',
        title: attributes[:title].to_s,
        max_price: attributes[:max_price].to_f,
        min_price: attributes[:min_price].to_f)
    else
      value = Product.all
    end
    value
  end

end
