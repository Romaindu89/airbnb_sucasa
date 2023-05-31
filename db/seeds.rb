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
picture11 = "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"

pictures = [picture1, picture2, picture3, picture4, picture5, picture6, picture7, picture8, picture9, picture10]
counter = 0

2.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    bio: "Hello there! I’m your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you’re here for a short getaway or an extended vacation, I’ll go above and beyond to make sure your time here exceeds your expectations."
  )
  file = URI.open(picture11)
  new_user.photo.attach(io: file, filename: "avatar.png", content_type: "image/jpg")
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
puts 'creating 1 super fake accommodation (several coherent pictures) ...'
new_user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: '123456',
  bio: "Hello there! I’m your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you’re here for a short getaway or an extended vacation, I’ll go above and beyond to make sure your time here exceeds your expectations."
)
new_user.save!
super_picture1 = "https://i.pinimg.com/originals/72/5e/d6/725ed67a503311cfa08ea07fc3835981.jpg"
super_picture2 = "https://media.architecturaldigest.com/photos/5d2f3540dea3bc0008636368/16:9/w_2580,c_limit/After-Photo-7.jpg"
super_picture3 = "https://cdn.trendir.com/wp-content/uploads/old/archives/2015/12/07/1-kitchen-design-lofts-3-urban-ideas-snaidero.jpg"
super_picture4 = "https://homedesignlover.com/wp-content/uploads/2016/04/4-loft-loft.jpg"

super_pictures = [super_picture1, super_picture2, super_picture3, super_picture4]
new_acco = Accommodation.new(
  title: Faker::Space.star,
  description: Faker::Lorem.paragraphs,
  address: Faker::Address.country,
  nb_of_guests: rand(1..15),
  user_id: new_user.id,
  price_per_night: rand(50..500)
)
super_pictures.each do |photo|
  file = URI.open(photo)
  new_acco.photos.attach(io: file, filename: "living_room.png", content_type: "image/jpg")
end
new_acco.save!

puts 'super fake accommodation created !'
