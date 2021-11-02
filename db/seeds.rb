# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    { name: 'hoge', email: 'example1@example.com', password: 'example1@example.com' },
    { name: 'fuga', email: 'example2@example.com', password: 'example2@example.com' },
  ]

users.each do |user|
  User.find_or_create_by!(email: user[:email]) do |credencial|
    credencial.name = user[:name]
    credencial.email = user[:email]
    credencial.password = user[:password]
  end
end