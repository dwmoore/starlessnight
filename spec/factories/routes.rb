FactoryGirl.define do
  factory :route do
    starting_system 'System One'
    starting_dock 'Dock 1'
    ending_system 'System Two'
    ending_dock 'Dock 2'
    distance 12.1
    commodity 'Gold'
    buy_price 1000
    sell_price 1800
    make_private true

    user
  end

end
