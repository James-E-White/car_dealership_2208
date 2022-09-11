class Car
 attr_reader :make, :model, :monthly_payment, :loan_length, :color

  def initialize(car, monthly_payment, loan_length, color = nil)
    @make = car.split.first
    @model = car.split.last
    @monthly_payment = monthly_payment
    @loan_length = loan_length
    @color = color
  end

  def total_cost
    @monthly_payment * @loan_length
  end

  def paint!(paint)
    @color = paint
  end
end
