class Car
 attr_reader :car, :monthly_payment, :loan_length, :make, :model, :color

  def initialize(car, monthly_payment, loan_length, color = nil)
    @car = car
    @make = "Ford"
    @model = "Mustang"
    @monthly_payment = monthly_payment
    @loan_length = (36)
    @color = color
  end

  def total_cost
    @total_cost = 54000
    #@monthly_payment * @loan_length
  end

  def paint!(paint)
    @color = paint
  end
end
