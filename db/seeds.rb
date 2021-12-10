# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Destination.destroy_all
Pin.destroy_all


User.create([
    {first_name: "Milan", last_name: "Mody", email: "milan@gmail.com", password: "1234"},
    {first_name: "Bob", last_name: "Test", email: "bob@bob.com", password: "1234"},
    {first_name: "Joe", last_name: "Test", email: "joe@joe.com", password: "1234"}
])

Destination.create([
    {city: "New York City", country: "United States of America"},
    {city: "London", country: "England"},
    {city: "Paris", country: "France"},
    {city: "Mumbai", country: "India"},
    {city: "Tokyo", country: "Japan"}
])