class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :permissions  , dependent: :destroy
  has_many :roles, through: :permissions , dependent: :destroy
  validate :role_must_be_unique
       
  SPECIAL_CHARACTERS = /.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\].*/
  validates :password, format: { with: SPECIAL_CHARACTERS  , message: "must include at least one special character"} ,on: :create

  def if_admin?
      self.roles.exists?(user_role: 'admin')
  end 
   
  

  # Custom validation method to check if the role is already assigned to the user
  def role_must_be_unique
    if user_roles.exists?(role: user_role)
      errors.add(:user_role, "Role is already assigned to the user")
    end
  end

  def has_role?(user_role)
      self.roles.exists?(user_role)
  end 
end
