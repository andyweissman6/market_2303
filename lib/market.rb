class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = Array.new(0)
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
      items << item.name
      end
    end
    items.uniq.sort
  end

  # def total_inventory
  #   total = {}
  #   @vendors.each do |vendor|
  #     vendor.inventory.sum do |item, quantity|
  #       require 'pry'; binding.pry
  #       total[item] = quantity
  #     end
  #   end
  # end


end