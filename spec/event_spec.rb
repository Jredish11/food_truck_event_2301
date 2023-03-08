require './lib/item'
require './lib/food_truck'
require './lib/event'


RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
    @food_truck3 = FoodTruck.new("Palisade Peach Shack") 
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe '#intialize' do
    it 'exists and has attributes' do
      expect(@event).to be_an Event
      expect(@event.name).to eq('South Pearl Street Farmers Market')

      expect(@event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck' do
    it 'add food trucks to the event' do
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item3, 25)
      @food_truck2.stock(@item4, 50)
      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it 'returns the list of FoodTruck names for an Event' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'returns the list of FoodTrucks that sell a given Item for an Event' do
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item3, 25)
      @food_truck2.stock(@item4, 50)
      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  end
end






# Graded Items:



# 5. Return the potential revenue from a FoodTruck: `FoodTruck #potential_revenue`

# A FoodTruck will be able to calculate their potential_revenue - the sum of all their items' price * quantity.

# A Event is responsible for keeping track of FoodTrucks. It should have a method called food_truck_names that returns an array of all the FoodTruck's names.

# Additionally, the Event should have a method called food_trucks_that_sell that takes an argument of an item represented as a String. It will return a list of FoodTrucks that have that item in stock.











# pry(main)> food_truck1.potential_revenue
# #=> 148.75

# pry(main)> food_truck2.potential_revenue
# #=> 345.00

# pry(main)> food_truck3.potential_revenue
# #=> 243.75  