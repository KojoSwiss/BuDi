require "open-uri"

puts 'Creating categories'

category = Category.new(
  name: "Food/Catering Services"
  )
  category.save!

category = Category.new(
  name: "Handyman Services"
  )
  category.save!

category = Category.new(
  name: "Makeup/Bodyworks Services"
  )
  category.save!

category = Category.new(
  name: "Photo/Video Service"
  )
  category.save!

category = Category.new(
  name: "Delivery Services"
  )
  category.save!

category = Category.new(
  name: "Other Services"
  )
  category.save!

puts 'Creating users'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    )
    puts "#{user.email} created"
    user.save!
end

puts 'Users created'

puts 'Creating Tasks'

Task.destroy_all

10.times do
  task = Task.new(
    title: Faker::Company.profession,
    description: Faker::Lorem.paragraphs,
    company: Faker::Movies::LordOfTheRings.character,
    url: Faker::Internet.url,
    category_id: rand(1..6),
    user_id: rand(1..7),
    location: Faker::Address.city
    )

  puts "#{task.title} done"
  task.save!
end
puts 'Done'

