FactoryBot.define do
  factory :user do
    nickname              { "test" }
    gender_id             { 2 }
    email                 { "test@test" }
    password              { "testtest1" }
    password_confirmation { "testtest1" }
  end
end
