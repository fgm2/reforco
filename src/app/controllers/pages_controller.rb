class PagesController < ApplicationController
  
  def index
    @teachers = Teacher.all.limit(4)
    @quantidade_of_teachers = Teacher.all.count
  end
  
  def show

  end
  
  def sobre
    # render 'pages/sobre'
  end
  
  def termos
    # render 'pages/termos'
  end
  
  def funcionamento
    render 'pages/como-funciona'
  end
  
end
