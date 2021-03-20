class Bug < ApplicationRecord
    belongs_to :project

    has_many :developerbugs , foreign_key: :user_id
    has_many :developers, class_name: "User", foreign_key: "user_id", dependent: :destroy ,through: :developerbugs

    validates :title , presence: true ,length: { in: 5..30 } , uniqueness: true
    validates :description, presence: true ,length: { in: 5..150 }
    validates :type, presence: true, inclusion: ["Feature", "Bug"]
    validates :status, presence: true, inclusion: ["new", "started", "completed"]

    self.inheritance_column = :_type_disabled

    after_initialize :init


    def init
        self.status  ||= "new"
    end
end 