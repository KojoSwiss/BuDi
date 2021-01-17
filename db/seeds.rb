require "open-uri"

puts 'Cleaning the database'

Task.destroy_all

200.times do
  task = Task.new(
    title: Faker::Company.profession,
    description: Faker::Company.catch_phrase,
    company: Faker::Movies::LordOfTheRings.character,
    url: Faker::Internet.url,
    category_id: rand(1..6)
    )

  puts "#{task.title} done"
  task.save!
end
puts 'Done'
