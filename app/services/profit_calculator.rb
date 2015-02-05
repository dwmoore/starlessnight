class ProfitCalculator
  def initialize(cargo_capacity, buy_price, sell_price)
    @cargo_capacity = cargo_capacity
    @buy_price = buy_price
    @sell_price = sell_price
  end

  def calculate
    profit = profit_loss
    profit * @cargo_capacity
  end

  private

  def profit_loss
    @sell_price - @buy_price
  end
end
