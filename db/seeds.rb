require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'user.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  u = User.new
  u.email = row['email']
  u.password = row['password']
  u.password_confirmation = row['password_confirmation']
  u.save
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# User.create(email:"prashant@abc", password:'password' ,password_confirmation: 'password')
# User.create(email:"vansh@abc", password:'password' ,password_confirmation: 'password')
# User.create(email:"gugu@abc", password:'password' ,password_confirmation: 'password')
# User.create(email:"ananat@abc", password:'password' ,password_confirmation: 'password')
# User.create(email:"abhishek@abc", password:'password' ,password_confirmation: 'password')
# User.create(email:"rajesh@abc", password:'password' ,password_confirmation: 'password')
