# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times { Category.create(name: Faker::Commerce.department) }

20.times do Article.create(title: Faker::Commerce.product_name,
                           body: Faker::Lorem.paragraph,
                           price: rand(20..100),
                           category_id: rand(1..5)
                           )
end