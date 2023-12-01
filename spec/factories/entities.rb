FactoryBot.define do
  factory :entity do
    amount { 10.0 }
    name { 'Example entity' }


    association :group, factory: :group
    association :author, factory: :user
  end
end
