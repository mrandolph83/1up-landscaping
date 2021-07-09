class User < ApplicationRecord
    has_many :jobs
    has_many :reviews, through: :jobs
    has_many :employees, through: :jobs

    validates :email, uniqueness: true, presence: true
    has_secure_password
end
