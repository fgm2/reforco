# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
            {:name => 'admin', :email => 'admin@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Fabrício Matos', :email => 'fgm2@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Fabiano Matos', :email => 'fgm@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Rogério Luiz', :email => 'rlcsf@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Nelson Cavalcante', :email => 'nbcj2@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Paulo de Tarso', :email => 'pt@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Maria Joaquina', :email => 'mj@reforco.com',:password => '123456', :password_confirmation =>'123456'},
            {:name => 'Carla Silva', :email => 'cs@reforco.com',:password => '123456', :password_confirmation =>'123456'},
  	    ]

users.each do |u|
  User.create!(u)
end

# --------------------

# areaOfKnowledge = [
#         {:name => 'Ciências Exatas e da Terra'},
#         {:name => 'Ciências Biológicas'},
#         {:name => 'Engenharias'},
#         {:name => 'Ciências da Saúde'},
#         {:name => 'Ciências Agrárias'},
#         {:name => 'Ciências Sociais Aplicadas'},
#         {:name => 'Ciências Humanas'},
#         {:name => 'Linguística, Letras e Artes'},
#         {:name => 'Outros'},
#   	 ]

# areaOfKnowledge.each do |a|
#   AreaOfKnowledge.create!(a)
# end