# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


#  require 'csv'

#  puts "Importing countries..."
#  CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
#    Country.create! do |country|
#      country.id = row[0]
#      country.name = row[1]
#    end
#  end
 
#  puts "Importing states..."
#  CSV.foreach(Rails.root.join("cities.csv"), headers: true) do |row|
#    City.create! do |city|
#      city.name = row[0]
#      city.country_id = row[2]
#    end
#  end
 
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#5.times do
    #Brand.create([{
   #     name: Faker::Appliance.brand
   # }])
   # end


# 6.times do
#     Category.create([{
#         name: Faker::Commerce.department(1, true)
#     }])
#     end

# 5.times do
#     Brand.create([{
#        name: Faker::Appliance.brand
#     }])
#     end

#  6.times do
#      Category.create([{
#          name: Faker::Commerce.department(1, true)
#      }])
#      end

#  6.times do
#      Store.create([{
#          name: Faker::Commerce.department,
#          summary: Faker::Lorem.sentence,
#          user_id: 1
#      }])
#      end


5.times do
    Coupone.create([{
        coupone_type: Faker::Number.digit
        value: Faker::Number.number(3)
        expiration_type: 1
        time: Faker::Time.forward(23, :morning)
        no_of_usage: Faker::Number.number(1)
        code: Faker::Number.number(5)
        status: 1
    }])
    end
# 5.times do
    
#     Product.create([{
#         title: Faker::Commerce.product_name,
#         description: Faker::Lorem.sentence,
#         price: Faker::Commerce.price,
#         quantity: rand(1..60),
#         store_id: 1,
#         category_id: 2,
#         brand_id: 3,
#         user_id: 1
#     }])
    
# end  



    
    # Order.create(
    #  cart_id:1,
    #  order_status:0,
    #  coupone_code:55,
    #  Address:"ahmed street",
    #  paid_price: 55,
    #  first_name:"asmaa",
    #  last_name:"saeed",
    #  email:"asmaa@yahoo.com",
    # )
    Order.create(
        cart_id:1,
        order_status:1,
        coupone_code:55,
        Address:"green street",
        paid_price: 55,
        first_name:"rawda",
        last_name:"sherif",
        email:"rawda@yahoo.com",
       )

       Order.create(
        cart_id:1,
        order_status:2,
        coupone_code:55,
        Address:"gleem street",
        paid_price: 55,
        first_name:"sarah",
        last_name:"mohamed",
        email:"sarah@yahoo.com",
       )
    
    


# -------------------------



# not working
# def seed_products
#    
     
# end
# seed_products



# def seed_users
#     user_id = 0
#     10.times do 
#       User.create(
#         name: Faker::Name.name,
#         email: Faker::Internet.email,
#         encrypted_password: 'enc',
#         reset_password_token: '123456',
#         reset_password_sent_at: '123456',
#         remember_created_at: 'crated at',
   
#         avatar: 'img',
#         role: 2,
#       )
#       user_id = user_id + 1
#     end
# end