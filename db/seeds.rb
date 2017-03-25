# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do
    user['first_name'] = Faker::Name.first_name
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['phone_number'] = Faker::PhoneNumber.phone_number
    user['nationality'] = Faker::Address.country
    user['birthday'] = Faker::Date.between(50.years.ago, Date.today)
    user['currency'] = 'Rupiah'


    User.create(user)
  end
end

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do
    listing['title'] = Faker::App.name
    listing['room_type'] = rand(1..3)
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['bed'] = rand(0..5)
    listing['bathroom'] = rand(1..6)
    listing['accomodate'] = rand(1..10)

    listing['google_address'] = "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip_code}, #{Faker::Address.state}, #{Faker::Address.country}"

    listing['city'] = Faker::Address.city
    listing['price'] = rand(3000000..50000000)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample
    listing['start_date'] = Date.today
    listing['end_date'] = Faker::Date.forward(7300)
    listing['kitchen'] = [true, false].sample
    listing['wifi'] = [true, false].sample

    Listing.create(listing)
  end
end
