# Specifications for the Sinatra Assessment

Specs:

- [x] Use Sinatra to build the app - Used sinatra
- [x] Use ActiveRecord for storing information in a database - activerecord was used to store all data in sqlite3 database as well as create all class relationships
- [x] Include more than one model class (e.g. User, Post, Category) - Used 4 models User, Movie, Actor, Genre
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Uses 3 many-to-many relationships as well as several has-many-through and one has-many belongs-to
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Movies belong-to a User
- [x] Include user accounts with unique login attribute (username or email) - Accounts are validated using activerecord
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Movie has complete CRUD functionaity
- [x] Ensure that users can't modify content created by other users - Users can only edit content with their id attached
- [x] Include user input validations - All inputs are validated as much as is reasonable ie. movies are validated to have a title, at least 1 genre, and at least 1 actor. Inputs theselves could not be validated due to the wide range of possible inputs.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - README is included

Confirm

- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
