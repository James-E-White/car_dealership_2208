require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
  before do
   @dealership = Dealership.new("Acme Auto", "123 Main Street")
 end

  it'exist' do
  expect(@dealership).to be_an_instance_of(Dealership)
  end

  it"starts with no cars in inventory"do
   expect(@dealership.inventory).to eq([])
  end

  it"has an inventory counter"do
  expect(@dealership.inventory_count).to eq(0)
  car_1 = Car.new("Ford Mustang", 1500, 36)
  car_2 = Car.new("Toyota Prius", 1000, 48)
  @dealership.add_car(@car_1)
  @dealership.add_car(@car_2)
  expect(@dealership.inventory).to eq([@car_1, @car_2])
  expect(@dealership.inventory_count).to eq(2)
 end

 it 'will check if dealership has inventory' do
    expect(@dealership.has_inventory?).to eq(false)
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)

    expect(@dealership.has_inventory?).to eq(true)

  end
  it 'will display cars by make' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)
    expect(@dealership.cars_by_make("Toyota")).to eq([car_2, car_3])
    expect(@dealership.cars_by_make("Ford")).to eq([car_1])

  end

  it 'can find the total value' do
    car_1 = Car.new("Ford Mustang", 1500, 36)
    car_2 = Car.new("Toyota Prius", 1000, 48)
    car_3 = Car.new("Toyota Tercel", 500, 48)
    car_4 = Car.new("Chevrolet Bronco", 1250, 24)
    @dealership.add_car(car_1)
    @dealership.add_car(car_2)
    @dealership.add_car(car_3)
    @dealership.add_car(car_4)


      expect(@dealership.total_value).to eq(156000)
    end

    it 'can give dealership details' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)
      expected = {
        "total_value" => 156000,
        "address" => "123 Main Street"
      }

      expect(@dealership.details).to eq(expected)
    end



    it 'can find average price of cars' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)

      expect(@dealership.average_price_of_car).to eq("39,000")

    end

    it 'can sort cars by price' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)
      expected = [car_3, car_4, car_2, car_1]

      expect(@dealership.cars_sorted_by_price).to eq(expected)
    end

    it 'create an inventory by make' do
      car_1 = Car.new("Ford Mustang", 1500, 36)
      car_2 = Car.new("Toyota Prius", 1000, 48)
      car_3 = Car.new("Toyota Tercel", 500, 48)
      car_4 = Car.new("Chevrolet Bronco", 1250, 24)
      @dealership.add_car(car_1)
      @dealership.add_car(car_2)
      @dealership.add_car(car_3)
      @dealership.add_car(car_4)
      # expected = {
      #   "Ford" => [car_1],
      #   "Toyota" => [car_2, car_3],
      #   "Chevrolet" => [car_4]
      #   }

      expect(@dealership.inventory_by_make).to eq({"Ford" => [car_1],"Toyota" => [car_2, car_3],"Chevrolet" => [car_4]})
    end
  end
