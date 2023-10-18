class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  validates :address, presence: true
end
