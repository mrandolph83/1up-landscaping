class Review < ApplicationRecord
    belongs_to :job
    
    
 
    validates_numericality_of :rating, :only_integer => true, :greater_than_or_equal_to => 0

    validates_numericality_of :rating, :only_integer => true, :less_than_or_equal_to => 5   
end
    