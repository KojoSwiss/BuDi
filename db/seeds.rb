require "open-uri"

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


10.times do
  task = Task.new(
    title: Faker::Company.profession,
    description: Faker::Lorem.paragraphs,
    company: Faker::Movies::LordOfTheRings.character,
    category_id: rand(19..24),
    user_id: rand(1..20),
    location: Faker::Address.city
    )

  puts "#{task.title} done"
  task.save!
end
puts 'Done'

