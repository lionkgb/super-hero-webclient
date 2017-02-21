class SuperHero
  attr_accessor :id, :name, :power, :descriptor

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @power = hash['power']
    @descriptor = hash['descriptor']
  end

  def self.find(id)
    super_hero_hash = Unirest.get("#{ENV['DOMAIN']}/superheroes/#{id}.json", :headers => {"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL']}).body
    @super_hero = SuperHero.new(super_hero_hash)
  end 
  def self.all
    super_hero_hashes = Unirest.get("#{ENV['DOMAIN']}/superheroes.json", :headers => { "Accept"=> "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['API_EMAIL']}).body
    @super_heroes = []
    super_hero_hashes.each do |super_hero_hash|
      @super_heroes << SuperHero.new(super_hero_hash)
    end
    return @super_heroes
  end


  def destroy
    @super_hero = Unirest.delete("#{ENV['DOMAIN']}/superheroes/#{id}.json").body
  end 

  def self.create(params)
    super_hero_hash = Unirest.post("#{ENV['DOMAIN']}/superheroes.json", :headers => {"Accept"=>"application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "X-User-Email"=> ENV['API_EMAIL']}, :parameters => params).body
    @super_hero = SuperHero.new(super_hero_hash)
  end 

  def edit(id)
    super_hero_hash = Unirest.get("#{ENV['DOMAIN']}/superheroes/#{id}.json", :headers => {"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "X-User-Email"=> ENV['API_EMAIL']}).body
    @super_hero = SuperHero.new(super_hero_hash)
  end 
  def update(params)
    super_hero_hash = Unirest.patch("#{ENV['DOMAIN']}/superheroes/#{id}.json", :headers => {"Accept"=> "application/json", "Authorization"=> "Token token=#{ENV['API_KEY']}", "X-User-Email"=> ENV['API_EMAIL']}, :parameters => params).body
    @super_hero = SuperHero.new(super_hero_hash)
  end
end
    

