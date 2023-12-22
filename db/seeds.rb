# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Order.destroy_all
Product.destroy_all
RecyclePoint.destroy_all
User.destroy_all
Address.destroy_all

# Users

user1 = User.create!(
  email: 'leo.diaz.trejo@gmail.com',
  password: '123456',
  first_name: 'Leo',
  last_name: 'Diaz',
  total_virtual_cash: 335.00
)
file = URI.open("https://avatars.githubusercontent.com/u/142075557?v=4")
user1.photo.attach(io: file, filename: "leo.png", content_type: "image/png")
user1.save!
puts "El usuario #{user1.first_name} se a creado correctamente"

user2 = User.create!(
  email: 'antoniovillalobos@gmail.com',
  password: '123456',
  first_name: 'Antonio',
  last_name: 'Villalobos',
  total_virtual_cash: 435.00
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1676405509/obzjnjjiruvajinkvmsl.jpg")
user2.photo.attach(io: file, filename: "antonio.png", content_type: "image/png")
user2.save!
puts "El usuario #{user2.first_name} se a creado correctamente"

user3 = User.create!(
  email: 'marco.soria@pucp.edu.pe',
  password: '123456',
  first_name: 'Marco',
  last_name: 'Soria',
  total_virtual_cash: 535.00
)
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1691789898/y5axo3cnuidqdr4p6cpj.jpg")
user3.photo.attach(io: file, filename: "marco.png", content_type: "image/png")
user3.save!
puts "El usuario #{user3.first_name} se a creado correctamente"

user4 = User.create!(
  email: 'curanderow@gmail.com',
  password: '123456',
  )

# Addresses

address1 = Address.create!(
  details: "Avenida Universitaria 832, San Miguel, Lima, Peru",
  latitude: -12.0789164,
  longitude: -77.0827831,
  addressable: user4
)
puts "La address #{address1} se ha creado correctamente"

# Recycle points

recycle_point1 = RecyclePoint.create!(
  category: 1,
  name: "punto1",
  description: "Primer punto",
)
puts "El punto de reciclaje #{recycle_point1} se ha creado correctamente"

# Products

product1 = Product.new(
  title: 'Pares Calcetines Bamboo Deportivos',
  description: 'Pack de 12 pares de calcetines cortos, tobilleras, lisos de fibra de Bamboo lo que impide el mal olor.Talla estándar que abarca numero 39 al 45.',
  details: '12 pares de calcetines - Hechos con fibra de bamboo',
  category: [1],
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
  category: [2],
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
  category: [0, 2],
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
  category: [1],
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
  category: [3],
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
  category: [1],
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
  category: [1],
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
  category: [2],
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
  category: [3],
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
  category: [0],
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
  category: [10],
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
  category: [1],
  quantity: 21,
  price: 7.00,
  user: user1,
  virtual_cash: 0.35
)
file = URI.open("https://http2.mlstatic.com/D_NQ_NP_749116-MLA69477867682_052023-O.webp")
product12.photo.attach(io: file, filename: "mini_garden.png", content_type: "image/png")
product12.save!
puts "El producto #{product12.title} se a creado correctamente"

# Cart

cart = Cart.create!(user: user2)

# Orders

order1 = Order.create!(user: user1, status: 0, purchase_date: Date.today)
SelectedProduct.create!(selected_productable: cart, quantity: 2, price: product1.price)
SelectedProduct.create!(selected_productable: order1, quantity: 1, price: product2.price)

puts "La order #{order1} se ha creado correctamente"
