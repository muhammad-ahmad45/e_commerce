class User < ApplicationRecord

  paginates_per 1
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :permissions, dependent: :destroy
  has_many :roles, through: :permissions , dependent: :destroy
       
  SPECIAL_CHARACTERS = /.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\].*/
  validates :password, format: { with: SPECIAL_CHARACTERS  , message: "must include at least one special character"} ,on: :create

  def if_admin?
      self.roles.exists?(user_role: 'admin')
  end

  def has_role?(user_role)
      self.roles.exists?(user_role)
  end 

end
