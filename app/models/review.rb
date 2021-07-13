class Review < ApplicationRecord
    belongs_to :job
    
    # validates :job, uniqueness: {scope: :user, message: "has already been reviewed"}
    
end
    