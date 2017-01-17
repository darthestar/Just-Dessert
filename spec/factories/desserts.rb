FactoryGirl.define do
  factory :dessert do
    sequence(:name) {|n| "Dessert#{n}"}
    description 'Layered Chocolaty-ness'
    user
  end
end
