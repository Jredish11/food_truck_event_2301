class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  
  def sorted_item_list
    all_items = @food_trucks.map do |food_truck|
      food_truck.inventory.keys.map do |item, quantity|
        item.name
      end
    end
    all_items.flatten.uniq.sort
  end

  def total_inventory
    inventory = {}
    inventory[item] = { "Quantity" => quantity, "Food_Trucks" => food_trucks_that_sell(item) }
  end

  def overstocked_items
    quantity= @food_trucks.sum do |food_truck|
      food_truck.inventory[item]
    end
    sold_by = @food_trucks.count do |food_truck|
      food_truck.inventory.include?(item)
    end
    if quantity > 50 && sold_by > 1
      item 
    else
      nil
    end
  end
  
  #helper methods
  
  def quantity
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        quantity
      end
    end
  end

  def item
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        item 
      end
    end
  end
end


 







  
  
   
