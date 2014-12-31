FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

    trait :with_routes do
      after(:create) do |user|
        FactoryGirl.create_list(:route, 5, user: user)
      end
    end

  end
end
