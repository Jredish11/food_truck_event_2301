class FoodTruck
  attr_reader :name, :inventory 
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item] += 0
    else
      0 
    end
  end

  def stock(item, quantity)
    if inventory.include?(item)
      @inventory[item] += quantity
    else
      @inventory[item] = quantity
    end
  end
  
end
