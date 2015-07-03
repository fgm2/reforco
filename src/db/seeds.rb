# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

userss = [
            {:name => 'admin', :email => 'admin@reforco.com.br',:password => 'mprof2014', :password_confirmation =>'mprof2014'},
  	    ]

userss.each do |u|
  User.create!(u)
end