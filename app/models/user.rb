class User < ApplicationRecord
    has_many :jobs
    has_many :reviews, through: :jobs
    has_many :employees, through: :jobs
    has_one_attached :image

    validates :email, uniqueness: true, presence: true
    has_secure_password

end
