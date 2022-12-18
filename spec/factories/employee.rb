FactoryBot.define do
  factory :employee do
    name { Faker::Name.unique.name }
    department
    status { 1 }
  end
end
