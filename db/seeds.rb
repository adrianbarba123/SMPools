# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying existing objects!"
User.delete_all
Pool.delete_all
PoolService.delete_all
Service.delete_all

puts "Creating two users 👤"
u1 = User.create(name: "Adrian", email: "adrian@example.com", password: "password")
u2 = User.create(name: "Fabio", email: "fabio@example.com", password: "password")

puts "Creating two pools 🏊"
p1 = Pool.create(address: "1234 Sesame St", size: 500, saltwater: true)
p2 = Pool.create(address: "4321 Sesame Ln", size: 700, saltwater: false)

puts "Creating pool services 👨‍🔧️"
ps1 = PoolService.create(date: "2023-02-19 14:00:00 PST")
ps2 = PoolService.create(date: "2023-02-25 15:30:00 PST")

puts "Creating services 🛠️"
s1 = Service.create(cleaning: true, chemical_balance: true, quote: false)
s2 = Service.create(cleaning: false, chemical_balance: false, quote: true)

puts "Done! ✅"