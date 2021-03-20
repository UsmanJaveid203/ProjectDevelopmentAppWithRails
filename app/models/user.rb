class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name , presence: true ,length: { in: 2..20 }
  validates :email, presence: true
  validates :password, presence: true ,length: { in: 3..10 }  ,format: { with: /[A-Za-z]{3}/, message: "Three characters are compulsory" }
  validates :type, presence: true, inclusion: ["Manager", "Developer", "Qa"]

end