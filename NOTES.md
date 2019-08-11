#App Overview

iTravel App for Users to record their travels, review their travel, and eventually share travels with other users.

#Users should be able to...
- login
- create account
- log out

#Users should be able to...
- create destination
- edit destination
- see destinations
- delete destinations

### Models ###
- User
- Destinations

#User Attributes
- name
- email/username
- password (bcrypt/ 'password_digest')

#User Associations
- has_many :destinations

#Destinations
      t.string :city
      t.string :state
      t.string :country
      t.text :trip_description
      t.string :slept_at
      t.text :slept_details
      t.string :restaurant_fav
      t.text :restaurant_details
      t.string :attraction_fav
      t.text :attraction_details
      t.text :recommendations

- :user_id (foreign key)
- TODO add date of trip?

#Destination Associations
- belongs_to :user

#MVP
- Users can signup, login, log out, and create travel entries

# Specifications for the Sinatra Assessment

Controllers
-----------
ApplicationController
UsersController
DestinationsController


ROUTES FOR DESTINATIONS
GET /destinations - (get destination reviews)
GET /destinations/:id - show.erb (show specific destination review)

GET /destinations/new - new.erb (form to create new destination review)
POST /destinations - (create route for creating destination review based on form submitted)

GET /destinations/:id/edit - edit.erb (update destination review)
PATCH /destinations/:id - (update route for udating destination review based on form submitted)

DELETE /destinations/:id - (delete route for deleting to do)