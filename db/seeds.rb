# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "kyle@me.com",
  password: "password"
)

5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password"
  )
end

users = User.all
puts "#{users.count} users created."

40.times do
  Item.create!(
    name: Faker::Company.bs,
    user: users.sample,
    created_at: rand(8.day.ago..Time.now)
  )

end

items = Item.all
puts "#{items.count} items created."
