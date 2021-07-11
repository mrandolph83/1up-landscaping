class Job < ApplicationRecord
    belongs_to :user
    belongs_to :employee
    has_many :reviews
    has_many_attached :images
    serialize :services

    accepts_nested_attributes_for :employee
end
