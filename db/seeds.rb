puts "Destroying existing objects!"
require 'date'

PoolService.delete_all
Pool.delete_all
Service.delete_all
User.delete_all

puts "Creating two users 👤"
u1 = User.create(name: "Adrian", email: "adrian@example.com", password: "password")
u2 = User.create(name: "Fabio", email: "fabio@example.com", password: "password")

puts "Creating two pools 🏊"
p1 = Pool.create(address: "1234 Sesame St", size: 500, saltwater: true, user: u1)
p2 = Pool.create(address: "4321 Sesame Ln", size: 700, saltwater: false, user: u2)

puts "Creating services 🛠️"
s1 = Service.create(cleaning: true, chemical_balance: true, quote: false)
s2 = Service.create(cleaning: false, chemical_balance: false, quote: true)

puts "Creating pool services 👨‍🔧️"
ps1 = PoolService.create(date: DateTime.new(2001,2,3,4,5,6), service: s1, pool:p1)
ps2 = PoolService.create(date: DateTime.new(2022,2,3,4,5,6), service: s2, pool:p2)

puts "Done! ✅"