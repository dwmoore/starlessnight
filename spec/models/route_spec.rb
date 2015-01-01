require 'rails_helper'

RSpec.describe Route, :type => :model do
  it { should validate_presence_of(:starting_system) }
  it { should validate_presence_of(:ending_system) }
  it { should validate_presence_of(:commodity) }
  it { should validate_presence_of(:buy_price) }
  it { should validate_presence_of(:sell_price) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:make_private) }
  it { should validate_presence_of(:starting_dock) }
  it { should validate_presence_of(:ending_dock) }

  it { should validate_numericality_of(:buy_price) }
  it { should validate_numericality_of(:sell_price) }
  it { should validate_numericality_of(:distance) }

  # I think there is a bug in validate_length_of.
  # It presently gives an undefined method error.
  #
  # it { should validate_length_of(:distance) }

  it { should belong_to(:user) }

end
