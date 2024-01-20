# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
SelectedProduct.destroy_all
Product.destroy_all
Order.destroy_all
Cart.destroy_all
RecyclePoint.destroy_all
User.destroy_all
Address.destroy_all

# Recycle points & addresses

recycle_point1 = RecyclePoint.create!(
  name: 'Puente Piedra',
  category: 1,
  description: 'Acepta materiales plásticos para reciclaje'
)

recycle_point2 = RecyclePoint.create!(
  name: 'Comas',
  category: 2,
  description: 'Centro de reciclaje de papel y cartón'
)

recycle_point3 = RecyclePoint.create!(
  name: 'Los Olivos',
  category: 3,
  description: 'Instalación de reciclaje de metal'
)

recycle_point4 = RecyclePoint.create!(
  name: 'Independencia',
  category: 1,
  description: 'Especializado en reciclaje de residuos plásticos'
)

recycle_point5 = RecyclePoint.create!(
  name: 'Comimtel Recycling',
  category: 4,
  description: 'Servicios de reciclaje en general'
)

puts "Se crearon los puntos de reciclaje"

address1 = Address.create!(
  details: 'Sta Genoveva 426c, Puente Piedra 15122, Perú',
  latitude: -11.840852845957572,
  longitude: -77.10222033558207,
  addressable: recycle_point1
)

address2 = Address.create!(
  details: 'Av. Arequipa 265, Lima 15046, Perú',
  latitude: -12.067516908251026,
  longitude: -77.03563387116411,
  addressable: recycle_point2
)

address3 = Address.create!(
  details: 'Av. Alfredo Mendiola 5810, Lima 15311, Perú',
  latitude: -11.964941191752642,
  longitude: -77.06716581349235,
  addressable: recycle_point3
)

address4 = Address.create!(
  details: 'Av Industrial 3484, Independencia 15311, Perú',
  latitude: -11.993062851019046,
  longitude: -77.05886719206123,
  addressable: recycle_point4
)

address5 = Address.create!(
  details: 'Av. Industrial 8032, Comas 15314, Perú',
  latitude: -11.93278924757652,
  longitude: -77.07144871534354,
  addressable: recycle_point5
)

puts "Se crearon las direcciones de los puntos de reciclaje"

# Users

user1 = User.create!(
  email: 'leo.diaz.trejo@gmail.com',
  password: '123456',
  first_name: 'Leo',
  last_name: 'Diaz',
  total_virtual_cash: 1000.00
)
file = URI.open("https://avatars.githubusercontent.com/u/142075557?v=4")
user1.photo.attach(io: file, filename: "leo.png", content_type: "image/png")
user1.save!
Address.last.destroy
puts "El usuario #{user1.first_name} se a creado correctamente"

user2 = User.create!(
  email: 'antoniovillalobos@gmail.com',
  password: '123456',
  first_name: 'Antonio',
  last_name: 'Villalobos',
  total_virtual_cash: 1000.00
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1676405509/obzjnjjiruvajinkvmsl.jpg")
user2.photo.attach(io: file, filename: "antonio.png", content_type: "image/png")
user2.save!
Address.last.destroy
puts "El usuario #{user2.first_name} se a creado correctamente"

user3 = User.create!(
  email: 'marco.soria@pucp.edu.pe',
  password: '123456',
  first_name: 'Marco',
  last_name: 'Soria',
  total_virtual_cash: 1000.00
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1691789898/y5axo3cnuidqdr4p6cpj.jpg")
user3.photo.attach(io: file, filename: "marco.png", content_type: "image/png")
user3.save!
Address.last.destroy
puts "El usuario #{user3.first_name} se a creado correctamente"

# Addresses para usuarios

address6 = Address.create!(
  details: "Avenida Revolución 1521, Col. Campestre, Ciudad de México, México",
  latitude: 19.351739,
  longitude: -99.190517,
  addressable: user1
)
puts "La dirección de Leo se ha creado correctamente"
p address6

address7 = Address.create!(
  details: "Avenida Simón Bolivar 2549, Ñuñoa, Santiago, Chile",
  latitude: -33.4498521,
  longitude: -70.6044052,
  addressable: user2
)
puts "La dirección de Antonio se ha creado correctamente"
p address7

address8 = Address.create!(
  details: "Avenida Universitaria 832, San Miguel, Lima, Peru",
  latitude: -12.0789164,
  longitude: -77.0827831,
  addressable: user3
)
puts "La dirección de Marco se ha creado correctamente"
p address8

# Products

product1 = Product.new(
  title: 'Pares Calcetines Bamboo Deportivos',
  description: 'Pack de 12 pares de calcetines cortos, tobilleras, lisos de fibra de Bamboo lo que impide el mal olor.Talla estándar que abarca numero 39 al 45.',
  details: '12 pares de calcetines - Hechos con fibra de bamboo',
  category: "organicos",
  quantity: 100,
  price: 15.99,
  user: user1,
  virtual_cash: 0.75
)
file = URI.open("https://res.cloudinary.com/dyptqsblk/image/upload/v1702602003/calcetines_bamboo_fxplm4.png")
product1.photo.attach(io: file, filename: "calcetines_bamboo.png", content_type: "image/png")
product1.save!
puts "El producto #{product1.title} se a creado correctamente"
product2 = Product.new(
  title: 'Toallita Húmeda 99.9% Agua Biodegradables',
  description: 'Cada toallita está hecha de tela hipoalergénica de fibras de bamboo con aceites esenciales. Estas wipes son orgánicas, hipoalergénicas, compostables en casa y 100% biodegradables. Libres de químicos nocivos y alcohol. Además, traen en su empaque una tapa dispensadora que las hace super cómodas para cambiar a tu bebé',
  details: 'Toallitas de fibra de bamboo - Hipoalergénicas',
  category: "organicos",
  quantity: 50,
  price: 20.99,
  user: user2,
  virtual_cash: 1.04
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_830568-MLC53827511681_022023-O.webp")
product2.photo.attach(io: file, filename: "calcetines_bamboo.png", content_type: "image/png")
product2.save!
puts "El producto #{product2.title} se a creado correctamente"
product3 = Product.new(
  title: 'Compostera',
  description: 'Para que reciclen gran parte de sus desechos y produzcan su propio abono. Incluye : Vermicompostera, Manual PDF con todos los cuidados',
  details: 'Compostera de madera reciclada',
  category: "madera",
  quantity: 10,
  price: 88.99,
  user: user3,
  virtual_cash: 4.44
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_920366-MLC40345636342_012020-O.webp")
product3.photo.attach(io: file, filename: "compostera.png", content_type: "image/png")
product3.save!
puts "El producto #{product3.title} se a creado correctamente"
product4 = Product.new(
  title: 'Cepillos de dientes de bamboo',
  description: 'Pack 12 unidades cepillo de dientes bamboo cerdas de fibra de carbón. Ecológico, biodegradable.',
  details: 'Cepillos de dientes de bamboo - Bíodegradable',
  category: "organicos",
  quantity: 15,
  price: 12.99,
  user: user1,
  virtual_cash: 0.64
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_978507-MLC43947713256_102020-O.webp")
product4.photo.attach(io: file, filename: "cepillo_bamboo.png", content_type: "image/png")
product4.save!
puts "El producto #{product4.title} se a creado correctamente"
product5 = Product.new(
  title: 'Zapatero Y Banco De bamboo',
  description: 'Zapatero y banco de bamboo, el producto viene separado en partes, con instrucciones para su armado',
  details: 'Zapatero y banco de bamboo',
  category: "madera",
  quantity: 15,
  price: 40.99,
  user: user2,
  virtual_cash: 2.04
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_637746-MLC69202031360_052023-O.webp")
product5.photo.attach(io: file, filename: "zapatero_bamboo.png", content_type: "image/png")
product5.save!
puts "El producto #{product5.title} se a creado correctamente"
product6 = Product.new(
  title: 'Bolsas De Basura Biodegradable',
  description: 'Bolsa de Basura Ecológica Pequeña para Escritorio o Baño. 100 unidades por rollo. 37 x 51 cms.',
  details: 'Bolsa de Basura bíodegradable',
  category: "plastico",
  quantity: 15,
  price: 7.00,
  user: user1,
  virtual_cash: 0.35
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_936496-MLC50512378463_062022-O.webp")
product6.photo.attach(io: file, filename: "bolsas_de_basura.png", content_type: "image/png")
product6.save!
puts "El producto #{product6.title} se a creado correctamente"
product7 = Product.new(
  title: 'Set Envoltorio Reutilizable Algodón Y Cera De Abeja',
  description: 'Envoltorios de tela de algodón con cera de abeja que permite envolver fuentes o alimentos para mantener su condición. Son reutilizables y una vez que pierden su vida útil los puedes compostar.',
  details: 'Envoltorios reutilizables - Bíodegradables',
  category: "organicos",
  quantity: 18,
  price: 9.00,
  user: user1,
  virtual_cash: 0.45
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_803057-MLC43207227180_082020-O.webp")
product7.photo.attach(io: file, filename: "envoltorio_compostable.png", content_type: "image/png")
product7.save!
puts "El producto #{product7.title} se a creado correctamente"
product8 = Product.new(
  title: 'Chocolate Semi Bitter 63% Cacao',
  description: 'Chocolate en lenteja. Apto para el consumo de personas veganas.',
  details: 'Chocolate con alto porcentaje de cacao',
  category: "otros",
  quantity: 30,
  price: 15.00,
  user: user2,
  virtual_cash: 0.75
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_900168-MLU69556144104_052023-O.webp")
product8.photo.attach(io: file, filename: "chocolate_semi_bitter.png", content_type: "image/png")
product8.save!
puts "El producto #{product8.title} se a creado correctamente"
product9 = Product.new(
  title: 'Leche De Coco Orgánica 400 Ml',
  description: 'Leche de coco, obtenida a partir de cocos frescos.',
  details: 'Leche de Coco Orgánica',
  category: "otros",
  quantity: 23,
  price: 18.00,
  user: user3,
  virtual_cash: 0.9
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_773426-MLU72427328853_102023-O.webp")
product9.photo.attach(io: file, filename: "leche_coco.png", content_type: "image/png")
product9.save!
puts "El producto #{product9.title} se a creado correctamente"
product10 = Product.new(
  title: 'Hisopos De Algodón Con Varita De Bambú',
  description: 'Hechas de algodón y madera de bambú, biodegradables y compostables.',
  details: 'Hisopos de algodón y bamboo',
  category: "organicos",
  quantity: 20,
  price: 5.00,
  user: user1,
  virtual_cash: 0.25
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_916689-MLC69202339538_052023-O.webp")
product10.photo.attach(io: file, filename: "hisopos_algodon.png", content_type: "image/png")
product10.save!
puts "El producto #{product10.title} se a creado correctamente"
product11 = Product.new(
  title: 'Hilo Dental Dobakaru Origen Vegetal',
  description: 'Hilo Dental 100% PLA (origen vegetal) con cera de candelilla y Xylitol natural, sabor a menta.',
  details: 'Hilo dental hecho con productos naturales',
  category: "organicos",
  quantity: 15,
  price: 10.00,
  user: user2,
  virtual_cash: 0.5
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_749116-MLA69477867682_052023-O.webp")
product11.photo.attach(io: file, filename: "hilo_dental.png", content_type: "image/png")
product11.save!
puts "El producto #{product11.title} se a creado correctamente"
product12 = Product.new(
  title: 'Minigarden Para Huerta Vertical Y Muro Verde',
  description: 'Fabricado en polipropileno copolímero de alta resistencia y contiene aditivos que proporcionan protección UV.',
  details: 'Huerta Vertival hecho con productos naturales',
  category: "otros",
  quantity: 21,
  price: 7.00,
  user: user1,
  virtual_cash: 0.35
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_749116-MLA69477867682_052023-O.webp")
product12.photo.attach(io: file, filename: "mini_garden.png", content_type: "image/png")
product12.save!
puts "El producto #{product12.title} se a creado correctamente"
