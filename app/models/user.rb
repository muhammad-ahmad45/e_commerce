class User < ApplicationRecord
  after_save :assign_default_customer 
  paginates_per 5
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :permissions, dependent: :destroy
  has_many :roles, through: :permissions , dependent: :destroy
  has_one :cart
  has_many :orders, dependent: :destroy

  SPECIAL_CHARACTERS = /.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\].*/
  validates :password, format: { with: SPECIAL_CHARACTERS  , message: "must include at least one special character"} ,on: :create

  def is_admin?
      self.roles.exists?(user_role: 'admin')
  end

  def has_customer?
    self.roles.exists?(user_role: 'customer')
  end

  def has_staff?
    self.roles.exists?(user_role: 'staff')
  end

  def assign_default_customer
    customer_role = Role.find_by(user_role: 'customer')
    if customer_role
      self.permissions.build(role_id: customer_role&.id)
    end
  end

end
