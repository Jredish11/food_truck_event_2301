require './lib/item'
require './lib/food_truck'


RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end
end




# Graded Items:
# 2. Create a FoodTruck with attributes: `FoodTruck.new`
# 3. Check quantity of an Item on the FoodTruck: `FoodTruck #check_stock`
# 4. Stock an Item on the FoodTruck: `FoodTruck #stock`
# The Event will need to keep track of its FoodTrucks and their Items. Each FoodTruck will be able to report its total inventory, stock items, and return the quantity of items. Any item not in stock should return 0 by default.





# pry(main)> food_truck.name
# #=> "Rocky Mountain Pies"

# pry(main)> food_truck.inventory
# #=> {}

# pry(main)> food_truck.check_stock(item1)
# #=> 0

# pry(main)> food_truck.stock(item1, 30)

# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}

# pry(main)> food_truck.check_stock(item1)
# #=> 30

# pry(main)> food_truck.stock(item1, 25)

# pry(main)> food_truck.check_stock(item1)
# #=> 55

# pry(main)> food_truck.stock(item2, 12)

# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}