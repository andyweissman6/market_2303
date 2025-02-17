require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  describe "iteration 2" do
    it "exists and has attributes" do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market).to be_a(Market)
      expect(market.name).to eq("South Pearl Street Farmers Market")
    end

    it "starts with an empty array of vendors" do
      market = Market.new("South Pearl Street Farmers Market")
      
      expect(market.vendors).to eq([])
    end

    it "#add_vendor/1" do
      market = Market.new("South Pearl Street Farmers Market")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)

      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end
  
    it "#vendor_names" do
      market = Market.new("South Pearl Street Farmers Market")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)

      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
    
    it "#vendors_that_sell/1" do
      market = Market.new("South Pearl Street Farmers Market")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)

      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      expect(market.vendors_that_sell(item4)).to eq([vendor2])
    end
  end

  describe "#iteration 3" do
    it "#sorted_item_list" do
      market = Market.new("South Pearl Street Farmers Market")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)

      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.sorted_item_list).to eq(["Banana Nice Cream", 'Peach', "Peach-Raspberry Nice Cream", 'Tomato'])

    end

    # it "#total_inventory" do
    #   market = Market.new("South Pearl Street Farmers Market")

    #   item1 = Item.new({name: 'Peach', price: "$0.75"})
    #   item2 = Item.new({name: 'Tomato', price: "$0.50"})
    #   item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    #   item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    
    #   vendor1 = Vendor.new("Rocky Mountain Fresh")
    #   vendor1.stock(item1, 35)
    #   vendor1.stock(item2, 7)

    #   vendor2 = Vendor.new("Ba-Nom-a-Nom")
    #   vendor2.stock(item4, 50)
    #   vendor2.stock(item3, 25)

    #   vendor3 = Vendor.new("Palisade Peach Shack")
    #   vendor3.stock(item1, 65)

    #   market.add_vendor(vendor1)
    #   market.add_vendor(vendor2)
    #   market.add_vendor(vendor3)

    #   expected = {
    #     item1: 100,
    #     item2: 7,
    #     item3: 25,
    #     item4: 50

    #   }
    #   expect(market.total_inventory).to eq(expected)
    # end
  end

end
