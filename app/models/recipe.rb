class Recipe < ApplicationRecord
    validates :title, presence: true
    validates :instructions, presence: true, length: {minimum: 50}
    validates :minutes_to_complete, presence: true
    
    belongs_to :user 
end
