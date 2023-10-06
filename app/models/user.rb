class User < ApplicationRecord

  paginates_per 2
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :permissions, dependent: :destroy
  has_many :roles, through: :permissions , dependent: :destroy
  has_one :cart
  SPECIAL_CHARACTERS = /.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\].*/
  validates :password, format: { with: SPECIAL_CHARACTERS  , message: "must include at least one special character"} ,on: :create
  validates :password_confirmation, presence: { message: " field is empty" }

  def if_admin?
      self.roles.exists?(user_role: 'admin')
  end

  def has_customer?
    self.roles.exists?(user_role: 'customer')
  end

end
