# Movie MVC

This app will allow users to add movies to their profile with a title, genres, and up to three actors. These movies can then be viewd and updated on their profile page. User's movies will aslo be visible on the movies page to all users, however only the user who created the movie will be allowed to edit or remove the movie. The genres and actors pages allow users to view movies by genre or actor respectively.

## Summary

- [Getting Started](#getting-started)
- [Authors](#authors)
- [License](#license)

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes.

### Installing

1. Fork and clone this repository

2. Change directories to where you installed the repo

   `cd your_install_path/movie-mvc`

3. Run migrations

   `rake db:migrate`

4. Seed database with required info

   `rake db:seed`

5. Run shotgun

   `shotgun`

6. Navigate to your local url in your browser: localhost:9393

## Authors

- **Jake Driscoll** -
  [jrdriscoll17](https://github.com/jrdriscoll17)
