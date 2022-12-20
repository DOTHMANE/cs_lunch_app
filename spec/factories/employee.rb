FactoryBot.define do
  factory :employee do
    name { Faker::Name.unique.name }
    department
    status { 1 }

    after(:build) { |employee| employee.class.skip_callback(:create, :after, :assign_new_employee, raise: false) }

    factory :assigned_new_employee do
      after(:create) { |user| user.send(:assign_new_employee) }
    end
  end
end
