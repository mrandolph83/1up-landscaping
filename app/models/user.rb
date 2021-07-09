class User < ApplicationRecord
    has_many :jobs
    has_many :reviews, through: :jobs
    has_many :employees, through: :jobs

    validates :email, uniqueness: true, presence: true
    has_secure_password

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
          u.password = SecureRandom.hex
        end
      end
end
