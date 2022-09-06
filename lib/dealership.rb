class Dealership
   attr_reader :dealership, :address, :inventory, :inventory_count

 def initialize(dealership, address)
   @dealership = dealership
   @address = address
   @inventory = []
   @inventory_count = 0
 end

 def inventory_count
   @inventory.length
 end

 def add_car(car)
   @inventory << car
 end

 def has_inventory?
    if @inventory == []
      false
    else
      true
    end
  end

  #def make(make)

end
