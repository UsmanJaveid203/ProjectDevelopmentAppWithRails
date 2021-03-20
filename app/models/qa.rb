class Qa < User
    has_many :bugs , dependent: :destroy
end