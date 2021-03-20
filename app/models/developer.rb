class Developer < User
    has_many :developerprojects, foreign_key: :user_id
    has_many :projects, dependent: :destroy, through: :developerprojects

    has_many :developerbugs , foreign_key: :user_id
    has_many :bugs, dependent: :destroy, through: :developerbugs
end