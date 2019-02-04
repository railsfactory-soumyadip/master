class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 	#attr_accessor :email, :name, :password, :password_confirmation
	# has_secure_password
	# validates :email, presence: true, uniqueness: true
 #  validates :password, presence:true, length:{within:8..32}, confirmation:true
end
