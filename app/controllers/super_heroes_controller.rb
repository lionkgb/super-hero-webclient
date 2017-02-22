class SuperHeroesController < ApplicationController
  def index 
    @super_heroes = SuperHero.all
  end

  def show 
    @super_hero = SuperHero.find(params[:id])
  end 

  def new 
  end 

  def create 
    @super_hero = SuperHero.create({name: params[:name], power:params[:power], descriptor: params[:descriptor]})
    redirect_to "/superheroes/#{@super_hero.id}"
  end

  def edit 
    @super_hero = SuperHero.find(params[:id])
  end 

  def update 
    @super_hero = SuperHero.find(params[:id])
    @super_hero.update({id: params[:id],name: params[:name], power: params[:power], descriptor: params[:descriptor]})
    redirect_to "/superheroes/#{@super_hero.id}"
  end 

  def destroy 
    @super_hero = SuperHero.find(params[:id])
    @super_hero.destroy
    redirect_to "/", :notice => "Super Hero Deleted"
  end  
end
