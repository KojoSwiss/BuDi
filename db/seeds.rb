require "open-uri"

Category.destroy_all

puts 'Creating category'

Category.create(name: "Food/Catering")
Category.create(name: "Handyman")
Category.create(name: "Makeup/Beauty")
Category.create(name: "Photo/Video")
Category.create(name: "Delivery")
Category.create(name: "Others")

puts 'Creating users'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    user_name: Faker::Movies::LordOfTheRings.character,
    )
    puts "#{user.email} created"
    user.save!
end

puts 'Users created'

puts 'Creating Tasks'


10.times do
  task = Task.new(
    title: Faker::Company.profession,
    description: Faker::Lorem.paragraphs,
    company: Faker::Movies::LordOfTheRings.character,
    category_id: rand(1..6),
    user_id: rand(1..10),
    location: Faker::Address.city
    )
  file = URI.open(Faker::Company.logo)
  task.photo.attach(io: file, filename: 'service.jpg', content_type: 'image/jpg')

  puts "#{task.title} done"
  task.save!
end
puts 'Done'




