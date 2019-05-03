# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

5.times do
    Brand.create([{
        name: Faker::Appliance.brand
    }])
    end

6.times do
    Category.create([{
        name: Faker::Commerce.department(1, true)
    }])
    end

20.times do
    Product.create([{
        title: Faker::Commerce.product_name;
        description: Faker::Lorem.sentence;
        price: Faker::Commerce.price;
        quantity: Faker::Number.number;
        image: Faker::Name.name;  
        store_id: Faker::Number.number;
        category_id: Faker::Number.number;
        brand_id: Faker::Number.number;
        user_id: Faker::Number.number;
    }])
end     