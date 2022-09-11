class Dealership
   attr_reader :dealership, :address, :inventory

 def initialize(dealership, address)
   @dealership = dealership
   @address = address
   @inventory = []

 end

 def inventory_count
   @inventory.length
 end

 def add_car(car)
   @inventory << car
 end

 def has_inventory?
    inventory_count > 0
    #@inventory != []

  end
  def cars_by_make(make)
    #@dealership.inventory[0].make
    @inventory.find_all do |car|
      car.make == make
    end
    #@inventory.find_all { |car| car.make == make }
    #@departments.find_all { |department| department.expenses < 500 }
  end

  def total_value
    #dealership.inventory[0].total_cost
    @inventory.sum do |car|
    car.total_cost
    end
  end

  def details
    {"total_value" => total_value,
    "address" => @address}
  end

  def average_price_of_car
    (total_value / @inventory.count).to_s.insert(2, ",")
  end

  def cars_sorted_by_price
    @inventory.sort_by do |car|
      car.total_cost
   end
  end

  def inventory_by_make
    inventory = {
      "Ford" => [],
      "Toyota" => [],
      "Chevrolet" => []
    }
    @inventory.each do |car|
     if car.make == "Ford"
       inventory["Ford"] << car
     elsif car.make == "Toyota"
       inventory["Toyota"] << car
     elsif car.make == "Chevrolet"
       inventory["Chevrolet"] << car
     end
   end
 inventory
 end
end
