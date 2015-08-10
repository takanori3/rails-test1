class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def list
    @books = Book.all
  end
  
  def json
    require 'net/http'
    require 'uri'
    require 'json'

    if area.nil? then
      area = 'Setagaya,jp'
    end

    json_url = 'http://api.openweathermap.org/data/2.5/weather?q=' + area + '&units=metric'
    
  # 読み込んで
    uri = URI.parse(json_url)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    
    puts result
    @result = result
    @area = area

  
  end
  
  def search
    require 'net/http'
    require 'uri'
    require 'json'

  # Post 
    area = params[:q]
    
    if area.nil? then
      area = 'Setagaya,jp'
      end

    json_url = 'http://api.openweathermap.org/data/2.5/weather?q=' + area + '&units=metric'
    
  # 読み込んで
    uri = URI.parse(json_url)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    
    puts result
    @result = result
    @area = area

  end
  

end
