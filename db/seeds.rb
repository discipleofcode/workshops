# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(email: 'admin@example.com', firstname: 'Admin', lastname: 'Admin', password: 'test1234', password_confirmation: 'test1234', admin: true)

users = User.create([
  { email: 'user1@example.com', firstname: 'Casey', lastname: 'Burke', password: 'test1234', password_confirmation: 'test1234'},
  { email: 'user2@example.com', firstname: 'Gale', lastname: 'Maxwell', password: 'test1234', password_confirmation: 'test1234'},
  { email: 'user3@example.com', firstname: 'Cohen', lastname: 'Lenny', password: 'test1234', password_confirmation: 'test1234'},
  { email: 'user4@example.com', firstname: 'Kent', lastname: 'Jamison', password: 'test1234', password_confirmation: 'test1234'},
  { email: 'user5@example.com', firstname: 'Melvin', lastname: 'Daryl', password: 'test1234', password_confirmation: 'test1234'},
])

category = Category.create(name: 'Clothing')

(1..8).each do |i|
  
  offset_user = rand(User.count)
  offset_category = rand(Category.count)
  Product.create(
    title: Faker::Commerce.product_name,
       description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price,
          category: Category.offset(offset_category).first,
            user: User.offset(offset_user).first)
end

(1..20).each do |i|
  offset_user = rand(User.count)
  offset_product = rand(Product.count)
  Review.create(content: Faker::Lorem.sentence, rating: rand(4)+1, product: Product.offset(offset_product).first, user: User.offset(offset_user).first)
end