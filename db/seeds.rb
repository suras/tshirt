# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if(!Category.find_by_name("Tshirts").present?)
Category.create(:name => "Tshirts" )
Category.create(:name => "Napkins" )
Category.create(:name => "Bags" )
Category.create(:name => "Cases" )
end

if(!User.find_by_email("admin@admin.com").present?)
	User.create(:email => "admin@admin.com", :password => "12345678", :is_admin => true)
end	


