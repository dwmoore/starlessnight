FactoryGirl.define do
  factory :route do
    make_private true
    starting_system 'System One'
    ending_system 'System Two'
    commodity 'Gold'
    buy_price 1000
    sell_price 1800
    distance 12.1
    starting_dock 'Dock 1'
    ending_dock 'Dock 2'

    user
  end

end
