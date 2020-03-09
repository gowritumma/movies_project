# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

	Genre.create(name: 'Comedy')
  	Genre.create(name: 'Action')
  	Genre.create(name: 'Thriller')
  	Genre.create(name: 'Family')
  	Genre.create(name: 'Romantic')
  	Genre.create(name: 'Mystery')
  	Genre.create(name: 'Historic')
  	Genre.create(name: 'Science Fiction')
  	Genre.create(name: 'Animated')
  	Genre.create(name: 'Horror')
  	Genre.create(name: 'Adventure')
  	Genre.create(name: 'Crime')
  	Genre.create(name: 'Music')
  	Genre.create(name: 'Drama')
  	Genre.create(name: 'Biographic')
  User.create(first_name: 'admin', last_name: 'user', username: 'admin_user', email:'admin@abc.com' ,password: '12345678', admin: true)
