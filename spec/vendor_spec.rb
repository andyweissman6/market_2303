require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  describe "iteration 1" do
    it "exists and has attributes" do
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor).to be_a(Vendor)

      expect(vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "starts with empty invetory hash" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      
      expect(vendor.inventory).to eq({})
    end

    it "#check_stock" do
      vendor = Vendor.new("Rocky Mountain Fresh")
      
      expect(vendor.inventory).to eq({})
  end
end