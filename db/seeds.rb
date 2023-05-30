require 'faker'

puts 'creating 20 fake users ...'
20.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
  new_user.save!
end
puts '20 fake users created !'

puts 'creating 20 fake accommodations ...'
u_id = 1
20.times do
  new_acco = Accommodation.new(
    title: Faker::Space.star,
    description: Faker::Lorem.paragraphs,
    address: Faker::Address.country,
    nb_of_guests: rand(1..15),
    user_id: u_id,
    price_per_night: rand(50..500)
  )
  u_id += 1
  new_acco.save!
end
puts '20 fake accommodations created ! '
