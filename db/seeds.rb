# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@gmail.com',
   password: '123456',
)


[
  ['会計経理関係'],
  ['労務関係'],
  ['利用者関係']
].each do |kind|
  Work.create!(
    { kind: kind }
  )
end