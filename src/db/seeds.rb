# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
          {:name => 'admin', :email => 'admin@reforco.com', :password => '123456', :password_confirmation =>'123456', :admin => true},
          {:name => 'Fabrício Matos', :gender => 'M', :cpf => '828.182.868-40', :scholarity => 'Mestrado', :date_of_birth =>'30/06/1988', :fone => '(38) 3201-3060', :whatsapp => '9999-0011', :addrress => 'Rua Gabriel Passos, 259, Centro', :city => 'Montes Claros', :state => 'Minas Gerais', :country => 'Brasil', :skype =>'fgmatos2',:email => 'fgm2@reforco.com',:password => '123456', :password_confirmation =>'123456'},
          {:name => 'Fabiano Matos',  :gender => 'M', :cpf => '828.182.356-20', :scholarity => 'Doutorado', :date_of_birth =>'30/06/1988', :fone => '(38) 3524-8562', :whatsapp => '9245-2033', :addrress => 'Rua João da Silva, 325, Centro',  :city => 'Januária', :state => 'Minas Gerais', :country => 'Brasil', :skype =>'fgmatos', :email => 'fgm@reforco.com',:password => '123456', :password_confirmation =>'123456'},
          {:name => 'Rogério Luiz',  :gender => 'M', :cpf => '828.182.868-40', :scholarity => 'Pós-graduação', :date_of_birth =>'02/02/1986', :fone => '(38) 3652-9850', :whatsapp => '9211-0221', :addrress => 'Rua 02, 220, Carmelo',  :city => 'Arinos', :state => 'Minas Gerais', :country => 'Brasil', :skype =>'csilva', :email => 'rlcsf@reforco.com',:password => '123456', :password_confirmation =>'123456'},
          {:name => 'Nelson Cavalcante', :gender => 'M', :cpf => '022.568.245-89', :scholarity => 'Pós-Doutorado',  :date_of_birth =>'21/02/1999', :fone => '(38) 2103-2252', :whatsapp => '5862-0121', :addrress => 'Rua Brailisa, 5542',  :city => 'Belo Horizonte', :state => 'Minas Gerais', :country => 'Brasil', :skype =>'nelsoncb', :email => 'nbcj2@reforco.com',:password => '123456', :password_confirmation =>'123456'},
          {:name => 'Paulo Victor Santos', :gender => 'M', :cpf => '221.365.895-84', :scholarity => 'Ensino Médio', :date_of_birth =>'15/01/1954', :fone => '(61) 2450-8566', :whatsapp => '8456-0254', :addrress => 'Rua Dr.João Gonçalves, 9852',  :city => 'Brasilia', :state => 'Brasília', :country => 'Brasil', :skype =>'paulojj', :email => 'pt@reforco.com',:password => '123456', :password_confirmation =>'123456'},
          {:name => 'Maria Joaquina', :gender => 'F', :cpf => '312.874.125-88', :scholarity => 'Graduação', :date_of_birth =>'13/02/1994', :fone => '(38) 2589-6658', :whatsapp => '6542-9852', :addrress => 'Av. Cristiano Araújo', :city => 'Pirapora', :state => 'Minas Gerais', :country => 'Brasil', :skype =>'mjduraes', :email => 'mj@reforco.com',:password => '123456', :password_confirmation =>'123456'},
          {:name => 'Carla Silva', :gender => 'F', :cpf => '410.023.358-98', :scholarity => 'Curso Técnico', :date_of_birth =>'02/08/1995', :fone => '(38) 3254-01452', :whatsapp => '2802-6312', :addrress => 'Rua Silva de Melo', :city => 'Salinas', :state => 'Minas Gerais', :country => 'Brasil', :skype =>'csilva', :email => 'cs@reforco.com',:password => '123456', :password_confirmation =>'123456'},
  	    ]

users.each do |u|
  User.create!(u)
end

# --------------------

teachers = [
            {:university => 'Instituto Federal do Norte de Minas Gerais', :formation => 'Tecnologo em Análise e Desenvolvimento de Sistemas', :user => User.find(2), :description => 'Grande esperiência como professor.' },
            {:university => 'Instituto Federal do Norte de Minas Gerais', :formation => 'Tecnologo em Análise e Desenvolvimento de Sistemas', :user => User.find(3), :description => 'Apaixonado por dar aula e ensinar.'},
            {:university => 'Universidade Estadual de Montes Claros', :formation => 'Bacharel em Sistemas de Informação', :user => User.find(4), :description => 'Um especialista em tudo que é tecnologico.'},
            {:university => 'Universidade Estadual de Montes Claros', :formation => 'Bacharel em Matemática', :user => User.find(5), :description => 'A matemática está em tudo. Basta vc olhar.'},
  	    ]

teachers.each do |t|
  Teacher.create!(t)
end

# --------------------

students = [
            {:description => 'Muito interesado sobre tudo.', :user => User.find(6)},
            {:description => 'Aprendendo a aprender...', :user => User.find(7)},
            {:description => 'A beleza das coisas está em aprender...', :user => User.find(8)},
  	    ]

students.each do |s|
  Student.create!(s)
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

areaOfKnowledge = [
        {:name => 'Ciências Agrárias'},
        {:name => 'Ciências Biológicas'},
        {:name => 'Ciências da Saúde'},
        {:name => 'Ciências Exatas e da Terra'},
        {:name => 'Engenharias'},
        {:name => 'Outros'},
        {:name => 'Ciências Humanas'},
        {:name => 'Ciências Sociais Aplicadas'},
        {:name => 'Linguística, Letras e Artes'},
        
  	 ]

areaOfKnowledge.each do |a|
  AreaOfKnowledge.create!(a)
end

# --------------------

# matters = [
#     {:name => 'Português', :descripition =>'Aula de português.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
#     {:name => 'Matemática', :descripition =>'Aula de Matemática.', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
#     {:name => 'Informática', :descripition =>'Aula de Informática.',:areaOfKnowledge=> AreaOfKnowledge.find(1)},
#     {:name => 'Inglês', :descripition =>'Aula de reforço de Inglês.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
#     {:name => 'Fisica', :descripition =>'Aula de física', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
#     {:name => 'Ciência', :descripition =>'Aula de Análise Combinatória, probabilidade e estatística.', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
#     ]

matters = [
    {:name => 'Ciência de Alimentos', :descripition =>'Aulas de Ciência de Alimentos.', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Ciências Agrárias I', :descripition =>'Aulas de Ciências Agrárias.', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Medicina Veterinária', :descripition =>'Aulas de Medicina Veterinária.', :areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Zootecnia / Recursos Pesqueiros', :descripition =>'Aulas de Zootecnia / Recursos Pesqueiros.',:areaOfKnowledge=> AreaOfKnowledge.find(1)},
    {:name => 'Biodiversidade', :descripition =>'Aulas de Biodiversidade.', :areaOfKnowledge=> AreaOfKnowledge.find(2)},
    {:name => 'Ciências Biológicas', :descripition =>'Aulas de Ciências Biológicas .', :areaOfKnowledge=> AreaOfKnowledge.find(2)},
    {:name => 'Educação Física', :descripition =>'Aulas de Educação Física.', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Enfermagem', :descripition =>'Aulas de Enfermagem.', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Farmácia', :descripition =>'Aulas de Farmácia', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Medicina', :descripition =>'Aulas de Medicina.', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Nutrição', :descripition =>'Aulas de Nutrição.', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Odontologia', :descripition =>'Aulas de Odontologia.', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Saúde Coletiva', :descripition =>'Aulas de Saúde Coletiva.', :areaOfKnowledge=> AreaOfKnowledge.find(3)},
    {:name => 'Astronomia / Física', :descripition =>'Aulas de Astronomia / Física.', :areaOfKnowledge=> AreaOfKnowledge.find(4)},
    {:name => 'Ciência da Computação', :descripition =>'Aulas de Ciência da Computação.', :areaOfKnowledge=> AreaOfKnowledge.find(4)},
    {:name => 'Geociências', :descripition =>'Aulas de Geociências.', :areaOfKnowledge=> AreaOfKnowledge.find(4)},
    {:name => 'Matemática / Probabilidade e Estatística', :descripition =>'Aulas de Matemática / Probabilidade e Estatística.', :areaOfKnowledge=> AreaOfKnowledge.find(4)},
    {:name => 'Química', :descripition =>'Aulas de Química.', :areaOfKnowledge=> AreaOfKnowledge.find(4)},
    {:name => 'Engenharias', :descripition =>'Aulas de Engenharias.', :areaOfKnowledge=> AreaOfKnowledge.find(5)},
    {:name => 'Biotecnologia', :descripition =>'Aulas de Biotecnologia.', :areaOfKnowledge=> AreaOfKnowledge.find(6)},
    {:name => 'Ciências Ambientais', :descripition =>'Aulas de Ciências Ambientais.', :areaOfKnowledge=> AreaOfKnowledge.find(6)},
    {:name => 'Ensino', :descripition =>'Aulas de Ensino.', :areaOfKnowledge=> AreaOfKnowledge.find(6)},
    {:name => 'Interdisciplinar', :descripition =>'Aulas de Interdisciplinar.', :areaOfKnowledge=> AreaOfKnowledge.find(6)},
    {:name => 'Materiais', :descripition =>'Aulas de Materiais.', :areaOfKnowledge=> AreaOfKnowledge.find(6)},
    {:name => 'Antropologia / Arqueologia', :descripition =>'Aulas de Antropologia / Arqueologia.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Ciência Política e Relações Internacionais', :descripition =>'Aulas de Ciência Política e Relações Internacionais.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Educação', :descripition =>'Aulas de Educação.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Filosofia / Teologia', :descripition =>'Aulas de Filosofia / Teologia.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Geografia', :descripition =>'Aulas de Geografia.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'História', :descripition =>'Aulas de História.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Psicologia', :descripition =>'Aulas de Psicologia.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Sociologia', :descripition =>'Aulas de Sociologia.', :areaOfKnowledge=> AreaOfKnowledge.find(7)},
    {:name => 'Administração, Ciências Contábeis e Turismo', :descripition =>'Aulas de Administração, Ciências Contábeis e Turismo.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Arquitetura e Urbanismo', :descripition =>'Aulas de Arquitetura e Urbanismo.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Ciências Sociais Aplicadas', :descripition =>'Aulas de Ciências Sociais Aplicadas.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Direito', :descripition =>'Aulas de Direito.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Economia', :descripition =>'Aulas de Economia.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Planejamento Urbano e Regional / Demografia', :descripition =>'Aulas de Planejamento Urbano e Regional / Demografia.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Serviço Social', :descripition =>'Aulas de Serviço Social.', :areaOfKnowledge=> AreaOfKnowledge.find(8)},
    {:name => 'Artes / Música', :descripition =>'Aulas de Artes / Música.', :areaOfKnowledge=> AreaOfKnowledge.find(9)},
    {:name => 'Letras / Linguística', :descripition =>'Aulas de Letras / Linguística.', :areaOfKnowledge=> AreaOfKnowledge.find(9)},
    
    ]
    
matters.each do |m|
  Matter.create!(m)
end
# --------------------

courses = [
    {:name => 'LibreOffice Básico', :matter =>Matter.find(15), :teacher=> Teacher.find(1), :value => 50},
    {:name => 'Programação Orientada a Objetos', :matter =>Matter.find(15), :teacher=> Teacher.find(2), :value => 65},
    {:name => 'Inglês Básico', :matter =>Matter.find(41), :teacher=> Teacher.find(2), :value => 44},
    {:name => 'Inglês Intermediário', :matter =>Matter.find(41), :teacher=> Teacher.find(3), :value => 85},
    ]

courses.each do |c|
  Course.create!(c)
end

# --------------------

matterTeacherStudent = [
    { :course => Course.find(1), :student => Student.find(1), :hours => 4},
    { :course => Course.find(2), :student => Student.find(2), :hours => 14},
    { :course => Course.find(3), :student => Student.find(3), :hours => 2},
    { :course => Course.find(4), :student => Student.find(1), :hours => 10},
    ]

matterTeacherStudent.each do |m|
  MatterTeacherStudent.create!(m)
end
# --------------------

recommendations = [
    {:rating => true, :descripition =>'Ótima aula', :course => Course.find(1), :student => Student.find(1)},
    {:rating => true, :descripition =>'Muito bom mesmo. recomendo!', :course => Course.find(2), :student => Student.find(2)},
    {:rating => false, :descripition =>'Não gostei do material nem da didatica.', :course => Course.find(4), :student => Student.find(3)},
    {:rating => true, :descripition =>'Melhor impossivel.', :course => Course.find(4), :student => Student.find(1)},
    ]

recommendations.each do |r|
  Recommendation.create!(r)
end