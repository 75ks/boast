FactoryBot.define do
  factory :comment do
    text        {"テストです"}
    association :user
    association :post
  end
end
