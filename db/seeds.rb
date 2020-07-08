# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



['men', 'women', 'kisd', 'shoes'].each do |catelogy|
  Catelogy.create(name: catelogy)
end
User.create! name:"DSon", admin: true, level: true ,email: "ss3@gmail.com",password:"123456"
User.create! name:"DSon", admin: false, level: true ,email: "3@gmail.com",password:"123456"
Catelogy.create(name: "thai")
Canpaign.create!(name: 'Sale 50%', content: 'sale all products', value: 1, status: true )
Orderdetail.create! order_id: 1, product_id: 7, quantity: 10
Orderdetail.create! order_id: 1, product_id: 6, quantity: 10
Orderdetail.create! order_id: 2, product_id: 30, quantity: 11
Orderdetail.create! order_id: 3, product_id: 7, quantity: 11
Orderdetail.create! order_id: 4, product_id: 30, quantity: 11
Orderdetail.create! order_id: 5, product_id: 7, quantity: 11
Orderdetail.create! order_id: 6, product_id: 7, quantity: 11
Orderdetail.create! order_id: 7, product_id: 6, quantity: 11
Orderdetail.create! order_id: 6, product_id: 29, quantity: 11
Orderdetail.create! order_id: 7, product_id: 29, quantity: 11
5.times do |n|
  Product.create!(name: "Vest Dior#{n}" ,
    catelogy_id: 1,
    price: 1000,
    size: 5)
end

# User.create! id: 3,name:"DG", admin: false, level: true ,email: "aaaaaa1@gmail.com",password:"123456"

# User.create(name: 'doan', admin: true, level: true, email: "aaaaa@gmail.com", password: "123456", password_confirmation: '123456')


