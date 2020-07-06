# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# ['men', 'women', 'kisd', 'shoes'].each do |catelogy|
#   Catelogy.create(name: catelogy)
# end

User.create! name:"DdSon", admin: true, level: true ,email: "aaaaa@gmail.com",password:"123456"
Canpaign.create!(name: 'Sale 50%', content: 'salr all products', value: 1, status: true )
Catelogy.create!(name:"gucci")
10.times do |n|
  Product.create!(name: "Shirt Gucci#{n}" ,
    catelogy_id: 1,
    price: 1000,
    size: 5)
end

# User.create! id: 3,name:"DG", admin: false, level: true ,email: "aaaaaa1@gmail.com",password:"123456"

# User.create(name: 'doan', admin: true, level: true, email: "aaaaa@gmail.com", password: "123456", password_confirmation: '123456')


