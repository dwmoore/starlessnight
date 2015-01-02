FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"

    factory :user_with_routes do
      transient do
        routes_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:route, evaluator.routes_count, user: user)
      end
    end
    
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
