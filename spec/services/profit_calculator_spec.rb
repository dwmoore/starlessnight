require 'rails_helper'

RSpec.describe ProfitCalculator do
  describe "#calculate" do
    it "calculates the profit from a traderoute" do
      cargo_capacity = 10
      buy_price = 1000
      sell_price = 2000

      profit = ProfitCalculator.new(cargo_capacity, buy_price, sell_price).calculate

      expect(profit).to eq(10000)
    end

    it "calculates the loss from a traderoute" do
      cargo_capacity = 10
      buy_price = 1000
      sell_price = 500

      profit = ProfitCalculator.new(cargo_capacity, buy_price, sell_price).calculate

      expect(profit).to eq(-5000)
    end
  end
end
