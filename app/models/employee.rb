class Employee < ApplicationRecord
    has_many  :jobs
    has_many :users, through: :jobs
    has_many :reviews, through: :jobs
    has_one_attached :image

    
end