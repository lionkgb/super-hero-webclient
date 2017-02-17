class SuperHeroesController < ApplicationController
  def index 
    @super_heroes = Unirest.get("#{ENV['DOMAIN']}/superheroes.json").body
  end 

  def show 
    @super_hero = Unirest.get("#{ENV['DOMAIN']}/superheroes/#{params[:id]}.json").body
  end 

  def new 
  end 

  def create 
    @super_hero = Unirest.post("#{ENV['DOMAIN']}/superheroes.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :power => params[:power], :descriptor => params[:descriptor]}).body
  render :show
  end

  def edit 
    @super_hero = Unirest.get("#{ENV['DOMAIN']}/superheroes/#{params[:id]}.json").body
  end 

  def update 
    @super_hero = Unirest.patch("#{ENV['DOMAIN']}/superheroes.json", :headers => {"Accept"=> "application/json"}, :parameters => {:name => params[:name], :power => params[:power], :descriptor => params[:descriptor]}).body
    redirect_to "/superheroes/#{@superhero['id']}"
  end 

  def destroy 
    Unirest.delete("#{ENV['DOMAIN']}/superheroes/#{params[:id]}.json").body
    redirect_to "/"
  end

  
end
