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

teachers = [
            {:formation => 'Tecnologo em Análise e Desenvolvimento de Sistemas', :user => User.find(2)},
            {:formation => 'Tecnologo em Análise e Desenvolvimento de Sistemas', :user => User.find(3)},
            {:formation => 'Bacharel em Sistemas de Informação', :user => User.find(4)},
            {:formation => 'Bacharel em Matemática', :user => User.find(5)},
  	    ]

teachers.each do |t|
  Teacher.create!(t)
end

# --------------------

students = [
            {:user => User.find(6)},
            {:user => User.find(7)},
            {:user => User.find(8)},
  	    ]

students.each do |s|
  Student.create!(s)
end

# --------------------

areaOfKnowledge = [
        {:name => 'Ciências Exatas e da Terra'},
        {:name => 'Ciências Biológicas'},
        {:name => 'Engenharias'},
        {:name => 'Ciências da Saúde'},
        {:name => 'Ciências Agrárias'},
        {:name => 'Ciências Sociais Aplicadas'},
        {:name => 'Ciências Humanas'},
        {:name => 'Linguística, Letras e Artes'},
        {:name => 'Outros'},
  	 ]

areaOfKnowledge.each do |a|
  AreaOfKnowledge.create!(a)
end

# --------------------

matters = [
    {:name => 'Português', :descripition =>'Aula de reforço de português', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Matemática', :descripition =>'Aula de reforço de Matemática', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Informática Básica', :descripition =>'Aula de reforço de Informática Básica',:areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Informática - Office', :descripition =>'Aula de reforço de Informática - Office', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Informática - POO', :descripition =>'Aula de reforço de Informática - POO', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Inglês Básico', :descripition =>'Aula de reforço de Inglês Básico', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Inglês Intermediário', :descripition =>'Aula de reforço de Inglês Intermediário', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Inglês Avançado', :descripition =>'Aula de reforço de Inglês Avançado', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    ]

matters.each do |m|
  Matter.create!(m)
end

# --------------------

recommendations = [
    {:rating => 1, :descripition =>'Ruim'},
    {:rating => 2, :descripition =>'Regular'},
    {:rating => 3, :descripition =>'Bom'},
    {:rating => 4, :descripition =>'Muito Bom'},
    {:rating => 5, :descripition =>'Excelente'},
    ]

recommendations.each do |r|
  Recommendation.create!(r)
end