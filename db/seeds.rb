# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@sample.com',
   password: "#{ENV['SECRET_KEY']}",
)


require "csv"
CSV.foreach('db/csv/業務分類一覧.csv', headers: true) do |row|
  Work.create(
    kind: row['kind']
  )
end


require "csv"
CSV.foreach('db/csv/福祉サービス一覧.csv', headers: true) do |row|
  Service.create(
    content: row['content']
  )
end
  
require "csv"
CSV.foreach('db/csv/デモソフト一覧.csv', headers: true) do |row|
  Soft.create(
    user_id: row['user_id'],
    work_id: row['work_id'],
    company: row['company'],
    address: row['address'],
    url: row['url'],
    introduction: row['introduction'],
    first_cost: row['first_cost'],
    month_cost: row['month_cost'],
    year_cost: row['year_cost'],
    function: row['function']
  )
end  
  
require "csv"
CSV.foreach('db/csv/デモユーザー一覧.csv', headers: true) do |row|
  User.create(
    name: row['name'],
    email: row['email'],
    password: row['password'],
    employee: row['employee']
  )
end