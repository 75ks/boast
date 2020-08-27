FactoryBot.define do
  factory :post do
    text        {"テストです"}
    association :user
  end
end