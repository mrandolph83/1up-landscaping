class Job < ApplicationRecord
    belongs_to :user
    belongs_to :employee
    has_many :reviews
    has_one_attached :image
    serialize :services

    accepts_nested_attributes_for :employee

    def self.user_jobs(id)
        where(user_id: id)
    end
end
