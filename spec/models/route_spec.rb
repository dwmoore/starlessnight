require 'rails_helper'

RSpec.describe Route, :type => :model do
  it { should validate_presence_of(:starting_system) }
  it { should validate_presence_of(:ending_system) }
  it { should validate_presence_of(:commodity) }
  it { should validate_presence_of(:buy_price) }
  it { should validate_presence_of(:sell_price) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:starting_dock) }
  it { should validate_presence_of(:ending_dock) }

  it { should validate_numericality_of(:buy_price) }
  it { should validate_numericality_of(:sell_price) }
  it { should validate_numericality_of(:distance) }

  it { should allow_value("12", "123", "34.00", "55.12", "0.01", "123.12").for(:distance) }
  it { should_not allow_value("123456", ".001", "1.001", "1111.22").for(:distance) }

  it { should belong_to(:user) }

end
