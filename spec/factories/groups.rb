FactoryBot.define do
  factory :group do
    name { 'Example Category' }
    icon { 'Food' }

    association :user, factory: :user
  end
end
