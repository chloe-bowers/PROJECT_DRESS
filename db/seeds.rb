# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
# Offer.destroy_all
# User.destroy_all

user = User.create!(first_name: "Ana", last_name: "Castaneda", email: "anita@hotmail.com", password: "Pedro1234", address: "Berlin")
p user
offer_1 = Offer.create(title: "Wonder in Ivory", size: 38, condition: "New", description: "This was my dream dress", user: user, price_per_day: 300.0)
p offer_1
user_clo = User.create(first_name: "Chloe", last_name: "Bowers", email: "chloe@hotmail.com", password: "Pedro1234", address: "Berlin")
Offer.create(title: "Amazing short dress", size: 38, condition: "New", description: "Perfect for a civil wedding!", user: user_clo, price_per_day: 150.0)
user_nicola = User.create(first_name: "Nicola", last_name: "H", email: "nicola@hotmail.com", password: "Pedro1234", address: "Berlin")
Offer.create(title: "One of a king", size: 40, condition: "New", description: "A dream!", user: user_nicola, price_per_day: 200.0)
