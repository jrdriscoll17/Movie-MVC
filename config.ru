require './config/environment'

raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' if ActiveRecord::Migrator.needs_migration?

use Rack::MethodOverride
use ActorsController
use GenresController
use MoviesController
use UsersController
run ApplicationController
