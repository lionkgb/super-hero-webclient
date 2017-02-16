class SuperHeroesController < ApplicationController
  def show 
    @super_hero = Unirest.get("http://localhost:3000/superheroes/#{params[:id]}.json")
  end 
end
