class Owner
  # code goes here
  attr_reader :name 
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def species
    @species = "human"
  end

  def say_species
    species = self.species
    "I am a #{species}."
  end

  def cats
    Cat.all.select{|cat| cat.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
    
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  # def sell_pet(pet)
  #   #pet.owner = nil
  #   pet.mood = "nervous"
  # end


  def sell_pets
    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end

    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets
    catcount = self.cats.count
    dogcount = self.dogs.count
    "I have #{dogcount} dog(s), and #{catcount} cat(s)."
  end
    
    
end