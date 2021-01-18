require "open-uri"

puts 'Cleaning the database'

Task.destroy_all

10.times do
  task = Task.new(
    title: Faker::Company.profession,
    description: Faker::Lorem.paragraphs(rand(2..8)).join('\n'),
    company: Faker::Movies::LordOfTheRings.character,
    url: Faker::Internet.url,
    category_id: rand(1..6),
    user_id: 1,
    location: Faker::Address.city
    )

  puts "#{task.title} done"
  task.save!
end
puts 'Done'
