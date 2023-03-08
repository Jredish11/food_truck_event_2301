require './lib/item'
require './lib/food_truck'


RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
    @food_truck3 = FoodTruck.new("Palisade Peach Shack") 
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe "#initialize" do
    it 'exits and has attributes' do
      expect(@food_truck).to be_an FoodTruck
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has inventory list, checks stock, adds stock to inventory' do
      expect(@food_truck.inventory).to eq({})
      expect(@food_truck.check_stock(@item1)).to eq(0)

      @food_truck.stock(@item1, 30)

      expect(@food_truck.inventory).to eq({@item1 => 30})

      expect(@food_truck.check_stock(@item1)).to eq(30)

      @food_truck.stock(@item1, 25)

      expect(@food_truck.check_stock(@item1)).to eq(55)

      @food_truck.stock(@item2, 12)

      expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end

  describe "#potential_revenue" do
    it 'checks potential_revenue for food truck' do
      @food_truck.stock(@item1, 35)
      @food_truck.stock(@item2, 7)
      @food_truck2.stock(@item3, 25)
      @food_truck2.stock(@item4, 50)
      @food_truck3.stock(@item1, 65)

      expect(@food_truck.potential_revenue).to eq(148.75)
      expect(@food_truck2.potential_revenue).to eq(345.00)
      expect(@food_truck3.potential_revenue).to eq(243.75)
    end
  end
end



# pry(main)> food_truck.potential_revenue
# #=> 148.75

# pry(main)> food_truck2.potential_revenue
# #=> 345.00

# pry(main)> food_truck3.potential_revenue
# #=> 243.75  
