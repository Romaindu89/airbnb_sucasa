require 'faker'
require 'open-uri'

Message.delete_all
Chatroom.delete_all
Booking.delete_all
Accommodation.delete_all
User.delete_all

picture1 = "https://a0.muscache.com/im/pictures/9b1faeae-d151-42ea-a498-18d9db4afe4b.jpg?im_w=1200"
picture2 = "https://a0.muscache.com/im/pictures/bb9ebad6-6048-41a8-8947-555d6527b94f.jpg?im_w=1200"
picture3 = "https://a0.muscache.com/im/pictures/miso/Hosting-534484668691956237/original/c592b1eb-8f33-432d-a536-9c29906dd3cb.jpeg?im_w=1440"
picture4 = "https://a0.muscache.com/im/pictures/prohost-api/Hosting-852103052054519896/original/5e197e8c-e611-4fb6-bb23-370908cbc1dc.jpeg?im_w=1200"
picture5 = "https://a0.muscache.com/im/pictures/0d1e5797-8f47-418f-acee-475f3b9c22c0.jpg?im_w=1200"
picture6 = "https://a0.muscache.com/im/pictures/miso/Hosting-671622319399090627/original/37e0ed75-118f-402e-95c7-2c62512acdd5.jpeg?im_w=1200"
picture7 = "https://a0.muscache.com/im/pictures/miso/Hosting-724287706736603735/original/68e4dc6a-14f5-49dd-8f30-3f53386ac2bd.jpeg?im_w=1440"
picture8 = "https://cdn.apartmenttherapy.info/image/upload/v1554209861/at/house%20tours%20stock%20archive/312b3933109935c5f33f6b8ec4a271669eb2d78a.jpg"
picture9 = "https://a0.muscache.com/im/pictures/miso/Hosting-50250873/original/785842db-7736-4bde-a9cb-c649e99f50a8.jpeg?im_w=1200"
picture10 = "https://a0.muscache.com/im/pictures/miso/Hosting-798490574765766838/original/89371196-d780-4a9c-a107-3d47e4b94451.jpeg?im_w=1200"
picture11 = "https://a0.muscache.com/im/pictures/769cd8c2-8c91-437d-8555-57e824189c8a.jpg?im_w=1200"
picture12 = "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"

add1 = "84 Cours de la Marne, 33000 Bordeaux"
add2 = "34 Rue Fernand Marin, 33000 Bordeaux"
add3 = "115 Rue des Pyrénées, 75020 Paris"
add4 = "3 Avenue Lacassagne, 69003 Lyon"
add5 = "14 Avenue du Maréchal Joffre, 93160 Noisy-Le-Grand"
add6 = "9 Rue du Commandant Jean Louis Tulasne, 62100 Calais"
add7 = "8 Rue des Écrivains, 67000 Strasbourg"
add8 = "5 Rue des Cordeliers, 44000 Nantes"

t1 = "Modern Apartment in the Heart of the City"
t2 = "Apartment with Spectacular Views"
t3 = "Cozy Apartment with Retro Vibes"
t4 = "Elegant and Spacious Apartment"
t5 = "Beachfront Apartment with Ocean Views"
t6 = "Countryside Apartment Surrounded by Nature"
t7 = "Chic Loft Apartment in a Vibrant Neighborhood"
t8 = "Stunning Apartment in a Heritage Building"

av1 = "https://avatars.githubusercontent.com/u/124033726?v=4"
av2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681734569/tw0tjyywko4ptppnu8sk.jpg"
av3 = "https://avatars.githubusercontent.com/u/119945585?v=4"
av4 = "https://avatars.githubusercontent.com/u/91269312?v=4"
av5 = "https://avatars.githubusercontent.com/u/124868861?v=4"
av6 = "https://avatars.githubusercontent.com/u/130972314?v=4"
av7 = "https://avatars.githubusercontent.com/u/130971878?v=4"
av8 = "https://avatars.githubusercontent.com/u/113199085?v=4"

pictures = [picture1, picture2, picture3, picture4, picture5, picture6, picture7, picture8, picture9, picture10, picture11]
fake_address = [add1, add2, add3, add4, add5, add6, add7, add8]
fake_title = [t1, t2, t3, t4, t5, t6, t7, t8]
fake_avatars = [av1, av2, av3, av4, av5, av6, av7, av8]
counter = 0

puts 'creating 8 fake users ...'
puts 'creating 8 fake accommodations ...'

8.times do
  new_user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    bio: "Hello there! I'm your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you're here for a short getaway or an extended vacation, I'll go above and beyond to make sure your time here exceeds your expectations."
  )
  file = URI.open(fake_avatars[counter])
  new_user.photo.attach(io: file, filename: "avatar.png", content_type: "image/jpg")
  new_user.save!
  new_acco = Accommodation.new(
    title: fake_title[counter],
    description: "Welcome to this charming apartment, a delightful and comfortable living space that offers a perfect blend of style and functionality. As you step inside, you'll be greeted by a warm and inviting ambiance, with tasteful decor and thoughtfully chosen furnishings that create a cozy atmosphere. The open-concept layout seamlessly connects the living, dining, and kitchen areas, allowing for effortless interaction and a spacious feel. The well-equipped kitchen provides all the necessary amenities for your culinary adventures, while the comfortable living area is perfect for relaxing and unwinding after a long day. The bedrooms offer a peaceful retreat, featuring cozy beds and ample storage space for your belongings. The apartment also includes a modern bathroom, complete with all the essential facilities and a soothing ambiance. Located in a convenient area, you'll find easy access to nearby amenities, such as shops, restaurants, and public transportation, making it an ideal choice for exploring the surrounding area. Whether you're traveling for business or pleasure, this generic apartment provides a comfortable and welcoming environment for your stay.",
    address: fake_address[counter],
    nb_of_guests: rand(1..15),
    user_id: new_user.id,
    price_per_night: rand(50..500)
  )
  file = URI.open(pictures[counter])
  new_acco.photos.attach(io: file, filename: "living_room.png", content_type: "image/jpg")
  new_acco.save!
  counter += 1
  puts "..."
end

puts '8 fake users created !'
puts '8 fake accommodations created ! '

puts 'creating 1 super fake accommodation (several coherent pictures) ...'
new_user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: '123456',
  bio: "Hello there! I'm your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you're here for a short getaway or an extended vacation, I'll go above and beyond to make sure your time here exceeds your expectations."
)
file = URI.open(picture12)
new_user.photo.attach(io: file, filename: "avatar.png", content_type: "image/jpg")
new_user.save!
super_picture1 = "https://i.pinimg.com/originals/72/5e/d6/725ed67a503311cfa08ea07fc3835981.jpg"
super_picture2 = "https://media.architecturaldigest.com/photos/5d2f3540dea3bc0008636368/16:9/w_2580,c_limit/After-Photo-7.jpg"
super_picture3 = "https://cdn.trendir.com/wp-content/uploads/old/archives/2015/12/07/1-kitchen-design-lofts-3-urban-ideas-snaidero.jpg"
super_picture4 = "https://homedesignlover.com/wp-content/uploads/2016/04/4-loft-loft.jpg"
super_pictures = [super_picture1, super_picture2, super_picture3, super_picture4]
new_acco = Accommodation.new(
  title: "Luxurious home in calm neighborood for a quiet stay",
  description: "Welcome to this charming apartment, a delightful and comfortable living space that offers a perfect blend of style and functionality. As you step inside, you'll be greeted by a warm and inviting ambiance, with tasteful decor and thoughtfully chosen furnishings that create a cozy atmosphere. The open-concept layout seamlessly connects the living, dining, and kitchen areas, allowing for effortless interaction and a spacious feel. The well-equipped kitchen provides all the necessary amenities for your culinary adventures, while the comfortable living area is perfect for relaxing and unwinding after a long day. The bedrooms offer a peaceful retreat, featuring cozy beds and ample storage space for your belongings. The apartment also includes a modern bathroom, complete with all the essential facilities and a soothing ambiance. Located in a convenient area, you'll find easy access to nearby amenities, such as shops, restaurants, and public transportation, making it an ideal choice for exploring the surrounding area. Whether you're traveling for business or pleasure, this generic apartment provides a comfortable and welcoming environment for your stay.",
  address: "8 Rue Castelnau d'Auros, 33000 Bordeaux",
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

puts "ultra accommodation in progress"

upic1 = "https://images.unsplash.com/photo-1629236714859-3a1ec2d8f6c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80"
upic2 = "https://images.unsplash.com/photo-1587500892601-9d1ebfaa05be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1548&q=80"
upic3 = "https://images.unsplash.com/photo-1613643043796-a370ee99ecbe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80"
upic4 = "https://images.unsplash.com/photo-1565623833408-d77e39b88af6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80"

ultra_pictures = [upic1, upic2, upic3, upic4]

new_user = User.new(
  first_name: "Romain",
  last_name: "Deflo",
  email: "romain@sucasa.com",
  password: '123456',
  bio: "Hello there! I'm your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you're here for a short getaway or an extended vacation, I'll go above and beyond to make sure your time here exceeds your expectations."
)
file = URI.open("https://media.licdn.com/dms/image/C5603AQHt6A6O0trmNg/profile-displayphoto-shrink_800_800/0/1517839980887?e=2147483647&v=beta&t=w088gT-EsnExEo6RtRHpylKlUYDY215BOB-81WRYCrA")
new_user.photo.attach(io: file, filename: "avatar-romain.png", content_type: "image/jpg")
new_user.save!
new_acco = Accommodation.new(
  title: "Beautiful penthouse in the city-center of Bordeaux",
  description: "Welcome to this luxurious penthouse apartment located in the heart of Bordeaux! Situated in a prime location, this spacious and stylish accommodation offers breathtaking panoramic views of the city. As you step inside, you'll be greeted by a beautifully designed open-concept living area, featuring high ceilings and large windows that flood the space with natural light. The apartment boasts modern and tasteful furnishings, creating a cozy yet sophisticated atmosphere. The fully equipped kitchen is a chef's delight, and the dining area provides a perfect setting for enjoying meals with friends or family. The bedrooms are elegantly furnished, offering ultimate comfort and tranquility. The highlight of this penthouse is the expansive terrace, where you can unwind and soak in the stunning views of Bordeaux's iconic landmarks. With its prime location and luxurious amenities, this penthouse apartment is an ideal choice for those seeking a memorable stay in Bordeaux.",
  address: "28 Cours de l'Intendence, 33000 Bordeaux",
  nb_of_guests: 12,
  user_id: new_user.id,
  price_per_night: 500
)
ultra_pictures.each do |picture|
  file = URI.open(picture)
  new_acco.photos.attach(io: file, filename: "penthouse.png", content_type: "image/jpg")
end
new_acco.save!

puts "ultra accommodation created !"

puts "ultra accommodation 2 in progress"

upic5 = "https://images.unsplash.com/photo-1493809842364-78817add7ffb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGF1c3NtYW5pYW4lMjBhcHBhcnRtZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"
upic6 = "https://images.unsplash.com/photo-1496180727794-817822f65950?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aGF1c3NtYW5pYW4lMjBhcHBhcnRtZW50fGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"
upic7 = "https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGhhdXNzbWFuaWFuJTIwYXBwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"
upic8 = "https://images.unsplash.com/photo-1556020685-ae41abfc9365?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGhhdXNzbWFuaWFuJTIwYXBwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"

ultra_pictures = [upic5, upic6, upic7, upic8]

new_user = User.new(
  first_name: "Somya",
  last_name: "Abbar",
  email: "somya@sucasa.com",
  password: '123456',
  bio: "Hello there! I'm your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you're here for a short getaway or an extended vacation, I'll go above and beyond to make sure your time here exceeds your expectations."
)
file = URI.open("https://avatars.githubusercontent.com/u/130504907?v=4")
new_user.photo.attach(io: file, filename: "avatar-somya.png", content_type: "image/jpg")
new_user.save!
new_acco = Accommodation.new(
  title: "Cosy and comfy flat in the Presqu'Ile",
  description: "Welcome to this charming and cozy apartment nestled in the heart of Lyon's Presqu'île! This delightful accommodation offers a warm and inviting ambiance, making it the perfect retreat for your stay in the city. Upon entering, you'll be greeted by a comfortable living area adorned with soft furnishings and tasteful decor. The apartment features a well-equipped kitchenette, where you can prepare delicious meals with ease. The bedroom is a peaceful haven, boasting a plush bed and soothing ambiance for a restful night's sleep. The highlight of this cozy apartment is its proximity to Lyon's vibrant Presqu'île district. Step outside, and you'll find yourself surrounded by charming streets lined with boutique shops, delightful cafes, and enticing restaurants. Take a leisurely stroll along the picturesque banks of the Rhône and Saône rivers, or explore the nearby cultural attractions and historical landmarks. Whether you're visiting Lyon for business or pleasure, this cozy apartment on the Presqu'île offers a delightful haven for your stay.",
  address: "15 Rue des Archers, 69000 Lyon",
  nb_of_guests: 4,
  user_id: new_user.id,
  price_per_night: 150
)
ultra_pictures.each do |picture|
  file = URI.open(picture)
  new_acco.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
new_acco.save!

puts "ultra accommodation 2 created !"


puts "ultra accommodation 3 in progress"

upic9 = "https://upload.wikimedia.org/wikipedia/commons/7/7d/Chambre_du_Dauphin%2C_Ch%C3%A2teau_de_Versailles_-_01.jpg"
upic10 = "https://up.univ-nantes.fr/medias/photo/csm-ref-versailles-france-54ddd70ccd_1681720826219-jpg"
upic11 = "https://www.chateaux-forts-de-france.fr/wp-content/uploads/2018/09/versailles-1.jpg"
upic12 = "https://www.transilien.com/sites/transilien/files/styles/manual_crop/public/2021-12/galerie-des-glaces.jpg?h=9a7773c7&itok=KEDAnHsE"

ultra_pictures = [upic9, upic10, upic11, upic12]

new_user = User.new(
  first_name: "Amar",
  last_name: "Slaoua",
  email: "amar@sucasa.com",
  password: '123456',
  bio: "Hello there! I'm your friendly and enthusiastic host for your upcoming stay in this beautiful city. As a born and raised local, I know all the hidden gems and insider tips to make your visit truly memorable. I have a passion for hosting and creating unique experiences for my guests. I take great pride in providing a comfortable and welcoming atmosphere, ensuring that you feel right at home during your stay. Whether you're here for a short getaway or an extended vacation, I'll go above and beyond to make sure your time here exceeds your expectations."
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1683008769/aoe1v4frlvgve2uei7f4.jpg")
new_user.photo.attach(io: file, filename: "avatar-amar.png", content_type: "image/jpg")
new_user.save!
new_acco = Accommodation.new(
  title: "Pretty little building next to Paris",
  description: "Welcome to this distinguished and conveniently located estate, just a stone's throw away from the bustling metropolis. Prepare to be captivated by this remarkable architectural masterpiece, a testament to a bygone era of opulence and enchantment. As you pass through the gates of this extraordinary property, you will be enveloped in an atmosphere of timeless elegance. The meticulously appointed interiors exude a sense of grace and refinement, inviting you to unwind and indulge in every corner. From the grand reception rooms to the sumptuous bedrooms, each space offers a sanctuary of relaxation and contemplation, enveloped in captivating beauty. The meticulously landscaped gardens, where nature and artistry converge in perfect harmony, beckon you to embrace tranquility and serenity. By choosing this estate, you are embarking on an extraordinary experience, where every detail is an invitation to enchantment. Whether for intimate gatherings, exclusive celebrations, or simply to immerse yourself in a magical ambiance, this exceptional residence promises an unforgettable stay, where subtlety and magnificence intertwine.",
  address: "1 Rue Robert de Cotte, 78000 Versailles",
  nb_of_guests: 600,
  user_id: new_user.id,
  price_per_night: 15000
)
ultra_pictures.each do |picture|
  file = URI.open(picture)
  new_acco.photos.attach(io: file, filename: "cosyflat.png", content_type: "image/jpg")
end
new_acco.save!

puts "ultra accommodation 3 created !"

puts "create a chatroom"

cr = Chatroom.new(
  name: "Plan your trip !"
)
cr.save

puts "chatroom created !"
