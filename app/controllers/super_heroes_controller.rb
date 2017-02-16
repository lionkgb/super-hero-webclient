class SuperHeroesController < ApplicationController
  def show 
    @super_hero = Unirest.get("http://localhost:3000/api/v1/superheroes/#{params[:id]}.json").body
  end 
end
