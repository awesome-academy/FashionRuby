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

Product.create!(name: 'Dolce gapagang',
				catelogy_id: 1,
				price: 5000,
				size: 5)

30.times do |n|
		name = Faker::Name.name
	Product.create!(name: name,
					catelogy_id: 2,
					price: 5000,
					size: 3)
end




# User.create!(name: "Example User",
# email: "son1111admin@gmail.com",
# password:
# "123456",
# password_confirmation: "123456",
# admin: true)
# # Generate a bunch of additional users.
# 9.times do |n|
# name = Faker::Name.name
# email = "son1111admin-#{n+1}@gmail.com"
# password = "123456"
# User.create!(name: name,
# email: email,
# password:
# password,
# password_confirmation: password)
# end

Productcart.delete_all
Productcart.create! id: 1, name: "Banana", price: 0.49, active: true
Productcart.create! id: 2, name: "Apple", price: 0.29, active: true
Productcart.create! id: 3, name: "Strawberries", price: 1.99, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"



Canpaign.create!(name: 'Sale 50%', content: 'salr all products', value: 1, status: true	)

User.create! id: 1,name:"DSon", admin: true, level: true ,email: "aaaaaa@gmail.com",password:"123456"
User.create! id: 3,name:"DG", admin: false, level: true ,email: "aaaaaa1@gmail.com",password:"123456"


