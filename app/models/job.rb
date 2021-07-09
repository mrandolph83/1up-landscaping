class Job < ApplicationRecord
    belongs_to :user
    belongs_to :employee
    has_many :reviews

    accepts_nested_attributes_for :employee
end
