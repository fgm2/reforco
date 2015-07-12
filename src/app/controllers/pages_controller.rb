class PagesController < ApplicationController
  
  def index
    @teachers = Teacher.all.limit(4)
  end
  
  def show

  end
  
  def sobre
    # render 'pages/sobre'
  end
  
  def termos
    # render 'pages/termos'
  end
  
end
