class SuperHeroesController < ApplicationController
  def index 
    @super_heroes = Unirest.get("#{ENV['DOMAIN']}/superheroes.json").body
  end 

  def show 
    @super_hero = Unirest.get("#{ENV['DOMAIN']}/superheroes/#{params[:id]}.json").body
  end 

  def create 
    @super_hero = Unirest.post("#{ENV['DOMAIN']}/superheroes.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :power => params[:power], :descriptor => params[:descriptor]}).body
  render :show
  end

  def new 
  end 
end
