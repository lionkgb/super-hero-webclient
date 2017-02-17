class SuperHeroesController < ApplicationController
  def index 
    @super_heroes = Unirest.get("http://localhost:3000/api/v1/superheroes.json").body
  end 

  def show 
    @super_hero = Unirest.get("http://localhost:3000/api/v1/superheroes/#{params[:id]}.json").body
  end 

  def create 
    @super_hero = Unirest.post("http://localhost:3000/api/v1/superheroes.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :power => params[:power], :descriptor => params[:descriptor]}).body
  render :show
  end

  def new 
  end 
end
