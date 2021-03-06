require_relative './module.rb'
require_relative './gun.rb'

class Hull 

  attr_accessor :frontArmor, :sideArmor, :rearArmor, :gun, :viewRange,
    :availableGuns, :weight, :db

  @@hulls = 0

  def initialize dict
    armor = [:frontArmor, :sideArmor, :rearArmor]
    armor.each do |att|
      instance_variable_set("@#{att}", Armor.new(dict[att.to_s]))
    end
    if dict["availableGuns"]
      @availableGuns = []
      available_guns_data = dict["availableGuns"]
      available_guns_data.each do |key, value|
        gun = Gun.new(value)
        gun.db = @db
        @availableGuns.push(gun)
      end
      @viewRange = dict[:viewRange.to_s]
    end
    @@hulls += 1
  end

  def self.count
    @@hulls
  end
  
  def self.to_s
    "Hull"
  end

end
