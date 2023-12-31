# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Restaurant.destroy_all


puts "Creating restaurants & Reviews..."

10.times do
    restaurant = Restaurant.create(
        name: Faker::Restaurant.name,
        address: Faker::Address.street_name,
        phone_number: Faker::PhoneNumber.phone_number,
        category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )
    puts "restaurant with id: #{restaurant.id} has been created"
end

10.times do
    review = Review.create(
        content: Faker::Restaurant.review,
        rating: rand(0..5)
    )
    puts "reviews inserted with id: #{review.id}"
end
puts "Finished!"