class Destination < ActiveRecord::Base
    belongs_to :user

    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :trip_description, presence: true
    validates :slept_at, presence: true
    validates :slept_details, presence: true
    validates :restaurant_fav, presence: true
    validates :restaurant_details, presence: true
    validates :attraction_fav, presence: true
    validates :attraction_details, presence: true
    validates :recommendations, presence: true
    
end
