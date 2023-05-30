require 'faker'
require 'open-uri'

puts 'creating 10 fake users ...'
puts 'creating 10 fake accommodations ...'

picture1 = "https://www.bhg.com/thmb/H9VV9JNnKl-H1faFXnPlQfNprYw=/1799x0/filters:no_upscale():strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg"
picture2 = "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2022/07/download-23.jpg"
picture3 = "https://www.lesarcsagence.com/UserFiles/File/Annuaire/annuaire_produits/10/20230404113837_0000030008_01.jpg"
picture4 = "https://parisdesignagenda.com/wp-content/uploads/2018/05/Interior-Design-Projects-Arty-Chic-Appartment-in-Paris-by-PFB-Design-5-1.jpg"
picture5 = "https://s42814.pcdn.co/wp-content/uploads/2020/09/iStock_185930591-scaled.jpg.optimal.jpg"
picture6 = "https://pictures.lodgix.com/media/gallery/property-75953/i018511_preview.jpg"
picture7 = "https://www.vrbo.com/vacation-ideas/wp-content/uploads/0Bu5ExcClizeeLLxT0tiB/999893b65383b25aa67e28e82dd53519/1c1d81b0-162b-4f81-a742-271cd4e64204.lg1.jpg"
picture8 = "https://cdn.apartmenttherapy.info/image/upload/v1554209861/at/house%20tours%20stock%20archive/312b3933109935c5f33f6b8ec4a271669eb2d78a.jpg"
picture9 = "https://wp-tid.zillowstatic.com/bedrock/app/uploads/sites/43/ZG_BrandGTM_0321_GettyImages-528689860-RT-ed6165.jpg"
picture10 = "https://tatinyhouse.com/wp-content/uploads/2022/10/13-Sunshine-03.jpg"

pictures = [picture1, picture2, picture3, picture4, picture5, picture6, picture7, picture8, picture9, picture10]
counter = 0

10.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
  new_user.save!
  new_acco = Accommodation.new(
    title: Faker::Space.star,
    description: Faker::Lorem.paragraphs,
    address: Faker::Address.country,
    nb_of_guests: rand(1..15),
    user_id: new_user.id,
    price_per_night: rand(50..500)
  )
  file = URI.open(pictures[counter])
  new_acco.photos.attach(io: file, filename: "living_room.png", content_type: "image/jpg")
  new_acco.save!
  counter += 1
end

puts '10 fake users created !'
puts '10 fake accommodations created ! '
