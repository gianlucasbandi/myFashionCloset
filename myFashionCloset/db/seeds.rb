# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new(
    :email => "angelone.1885574@studenti.uniroma1.it",
    :password => "myFashionCloset",
    :username => "admin",
    :admin => "true"
)
user.save!

user2 = User.new(
  :email => "russo.1918968@studenti.uniroma1.it",
  :password => "myFashionCloset",
  :username => "admin_2",
  :admin => "true"
)
user2.save!

user3 = User.new(
  :email => "sbandi.1792041@studenti.uniroma1.it",
  :password => "myFashionCloset",
  :username => "admin_3",
  :admin => "true"
)
user3.save!

user4 = User.new(
  :email => "contento.1900258@studenti.uniroma1.it",
  :password => "myFashionCloset",
  :username => "admin_4",
  :admin => "true"
)
user4.save!