class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    SPECIAL_CHARACTERS = /.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\].*/
  validates :password, format: { with: SPECIAL_CHARACTERS  , message: "must include at least one special character"}

end
