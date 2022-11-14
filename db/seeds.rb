puts "🌱 Seeding ..."

puts "Clearing database"
Review.destroy_all
Product.destroy_all
User.destroy_all

puts "Creating products..."

response = RestClient.get "https://drip-mall-project.herokuapp.com/products"
products_hash = JSON.parse(response)
products_hash.each do |product|
    single_product = Product.create(
        image: product["image"],
        title: product["title"],
        category: product["category"],
        price: product["price"],
        actual_price: product["actual_price"],
        discount: product["discount"],
    )
end

puts "Creating reviews & users..."

3.times do
    user = User.create(
        name: Faker::Name.name,
        password: Faker::Internet.password(min_length: 10, max_length: 20)
    )
    review = Review.create(
        comment: Faker::Lorem.word,
        rating: rand(1..5),
        user_id: user.id,
        product_id: rand(1..20)
    )
end

puts "✅ Done seeding!"
