class SuperHero
  attr_accessor :id, :name, :power, :descriptor

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @power = hash['power']
    @descriptor = hash['descriptor']
  end