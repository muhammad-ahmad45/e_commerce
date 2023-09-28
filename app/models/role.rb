class Role < ApplicationRecord

  has_many :permissions, dependent: :destroy
  has_many :users, through: :permissions 

  validates :user_role, inclusion: { in: %w(admin staff customer),
    message: "%{value} is not a valid user" }

end
