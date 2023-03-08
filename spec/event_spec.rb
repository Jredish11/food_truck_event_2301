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

  describe "#overstocked_items"
    it 'Return a list of overstocked Items for an Event' do
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item3, 25)
      @food_truck2.stock(@item4, 50)
      @food_truck3.stock(@item1, 65)

      expect(@event.overstocked_items).to eq([@item1])

      @food_truck3.stock(@item3, 26)

      expect(@event.overstocked_items).to eq([@item1, @item3])
    end

    it 'sorted_item_list that returns a list of names of all items the FoodTrucks have in stock, sorted alphabetically' do 
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item3, 25)
      @food_truck2.stock(@item4, 50)
      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.sorted_item_list).to eq(['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"])
    end

    it 'reports the quantities of all items sold at the event' do
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item3, 25)
      @food_truck2.stock(@item4, 50)
      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expected = { @item1 => {  'Quantity' => 100,
                                'Food_Trucks' => [@food_truck1, @food_truck3] },
                    @item2 => {  'Quantity' => 7,
                                'Food_Trucks' => [@food_truck1] },
                    @item3 => {  'Quantity' => 25,
                                'Food_Trucks' => [@food_tuck2] },
                    @item4 => {  'Quantity' => 50,
                                'Food_Trucks' => [@food_tuck2] },
                  }     
        expect(@event.total_inventory).to eq(expected)
  end
end

 
    






                # Graded Items:
          #  1. Return a list of overstocked Items for an Event: `Event #overstocked_items`
          #  1. Return a hash of total inventory from an Event: `Event #total_inventory`
          # 
          # Your Event will be able to identify overstocked_items. An item is overstocked if it is sold by more than 1 food truck AND the total quantity is greater than 50.


          # Additionally, your Event class should have a method called total_inventory that reports the quantities of all items sold at the event. Specifically, it should return a hash with items as keys and hash as values - this sub-hash should have two key/value pairs: quantity pointing to total inventory for that item and food_trucks pointing to an array of the food trucks that sell that item.



