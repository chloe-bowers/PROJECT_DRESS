# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
puts "Cleaning database..."
Offer.destroy_all
User.destroy_all

user = User.create!(first_name: "Ana", last_name: "Castaneda",
                    email: "anita@hotmail.com", password: "Pedro1234", address: "Berlin")

file1 = URI.open("https://img.ltwebstatic.com/images3_pi/2022/04/19/165036126511dbcdb04dcbcf00cba917c7ebca35a0_thumbnail_900x.webp")
offer_1 = Offer.new(title: "Wonder in Ivory", size: 38, condition: "New",
                    description: "This was my dream dress", user: user, price_per_day: 300.0)
offer_1.photo.attach(io: file1, filename: "dress1.png", content_type: "image/png")
offer_1.save

user_clo = User.create(first_name: "Chloe", last_name: "Bowers",
                       email: "chloe@hotmail.com", password: "Pedro1234", address: "Berlin")

file2 = URI.open("https://www.rlmedia.io/is/image/PoloGSI/s7-1440702_alternate10?$rl_df_pdp_5_7_a10$")
offer_2 = Offer.new(title: "Amazing short dress", size: 38, condition: "New",
                    description: "Perfect for a civil wedding!", user: user_clo, price_per_day: 150.0)
offer_2.photo.attach(io: file2, filename: "dress2.png", content_type: "image/png")
offer_2.save


user_nicola = User.create(first_name: "Nicola", last_name: "H",
                          email: "nicola@hotmail.com", password: "Pedro1234", address: "Berlin")
file3 = URI.open("https://img.ltwebstatic.com/images3_pi/2022/01/21/16427319378b5123722bf345c71c2ed828f205010a_thumbnail_900x.webp")
offer_3 = Offer.new(title: "One of a king", size: 40, condition: "New", description: "A dream!",
                    user: user_nicola, price_per_day: 200.0)
offer_3.photo.attach(io: file3, filename: "dress3.png", content_type: "image/png")
offer_3.save
