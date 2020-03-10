# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies
Rails version : Rails 5.1.7

Ruby version : ruby 2.4.1p111

clone the repository
>git clone <clone_url>

do the bundle install

* Configuration
modify the username and password in the config\database.yml file accordingly

* Database creation
    >rails:db:create

* Database initialization
 command to create the tables
    rails db:schema:load
 command to populate the genres table and create a default admin user.                                               
    rails db:seed

* How to run the test suite
RSPEC

To migrate the database table schema

rails db:migrate RAILS_ENV=test

To seed genres data
rails db:seed RAILS_ENV=test

Rspec commands to run the testcases

rspec ./spec/controllers/api/v1/scores_controller_spec.rb

rspec ./spec/controllers/api/v1/movies_controller_spec.rb


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
