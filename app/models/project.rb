class Project < ApplicationRecord
    belongs_to :manager, class_name: "User", foreign_key: "user_id"
    has_many :bugs , dependent: :destroy
    has_many :developerprojects , foreign_key: :user_id
    has_many :developers, class_name: "User", foreign_key: "user_id", dependent: :destroy, through: :developerprojects



  validates :name , presence: true ,length: { in: 15..30 }
  validates :description, presence: true ,length: { in: 150..300 }
end  