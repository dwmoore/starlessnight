require 'rails_helper'

RSpec.describe Route, :type => :model do
  it { should validate_presence_of(:starting_system) }
  it { should validate_presence_of(:ending_system) }
  it { should validate_presence_of(:commodity) }
  it { should validate_presence_of(:buy_price) }
  it { should validate_presence_of(:sell_price) }
  it { should validate_presence_of(:jump_distance) }
  it { should validate_presence_of(:starting_dock) }
  it { should validate_presence_of(:ending_dock) }
  it { should validate_presence_of(:dock_distance) }
  it { should validate_presence_of(:cargo_capacity) }

  it { should validate_numericality_of(:buy_price) }
  it { should validate_numericality_of(:sell_price) }
  it { should validate_numericality_of(:jump_distance) }
  it { should validate_numericality_of(:dock_distance) }
  it { should validate_numericality_of(:cargo_capacity) }

  it { should allow_value("12", "123", "34.00", "55.12", "0.01", "123.12").for(:jump_distance) }
  it { should_not allow_value("123456", ".001", "1.001", "1111.22").for(:jump_distance) }

  it { should belong_to(:user) }

  describe "#route_profit" do
    it "returns the profit of a trade route" do
      route = build(:route, cargo_capacity: 10, buy_price: 1000, sell_price: 2000)

      profit = route.route_profit

      expect(profit).to eq(10000)
    end

    it "returns the loss of a trade route" do
      route = build(:route, cargo_capacity: 10, buy_price: 1000, sell_price: 500)

      profit = route.route_profit

      expect(profit).to eq(-5000)
    end
  end
end
