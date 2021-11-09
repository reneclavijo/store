class PagesController < ApplicationController
  def home
    cookies[:mi_primera_cookie] = "Hola mundo"
  end
end
