Specs:

 [x]Use Sinatra to build the app
   - Looking at the gemfile you can see that Sinatra is being utilized, it is required within my gemfile, set within my environment file through ENV['SINATRA_ENV'] ||= "development" and then it is then the class Application Controller is inheriting from the Sinatra::Base, this is then applied to my other controllers by the Application controller inheritence.

 [x]Use ActiveRecord for storing information in a database
   - Similarly to Sinatra being required within my gemfile, ActiveRecord record is being required. It is an ORM (Object Relational Mapping) that is allowing interaction betwee my database and code. Through my migrations ActiveRecord my models User and Destination inherit from ActiveRecord allowing my code to interact with the database tables.

 [x]Include more than one model class (e.g. User, Post, Category)
    - I established two models User and Destination.

 [x]Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - My User class has a has_many relationship with Destination.

 [x]Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - My Destination class belongs_to User.

 [x]Include user accounts with unique login attribute (username or email)
    - My user accounts are validated with a unique email through establishing the ActiveRecord validation validates :email, presence: true, uniqueness: true in the user.rb model. The uniqueness: true is what requires the user email to be unique.

 [x]Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - In my destinations_controller routes were established to follow Restful Routing and CRUD to create, read, update, and delete destinations.

 [x]Ensure that users can't modify content created by other users
    - Through the utilization of two helper methods established in my application_controller.rb, current_user and authorized_to_edit, AND a class helper in my destinations_controller.rb destination_instance, only the user who created content are able to edit or delete their destination posts. 
    
    The destination_instance is utilized by both the edit and delete routes by finding the :id of the destination instance, and through the current_user being identified through the current :user_id matching the session :user_id, then if the destination user is equal to the current user they are "authorized_to_edit?". These buttons only show up on the show.erb pages through an if statement returning true it triggers the code found in the show.erb.

 [x]Include user input validations
   - Included similarly to email validation, but did not require uniqueness.

 [ ]BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
   - Will complete for project review.

 [x]Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  
Confirm

 [x]You have a large number of small Git commits
  - I probably could have had more, but I forgot sometimes. There were also a few times where I had errors that I ran into where I ended up deleting a bunch of code.

 [x]Your commit messages are meaningful
   - I still have room for improvement and need to look into other types of commits.
 [x]You made the changes in a commit that relate to the commit message
 
 [x]You don't include changes in a commit that aren't related to the commit message
 - I still have room for improvement and better commit practices.