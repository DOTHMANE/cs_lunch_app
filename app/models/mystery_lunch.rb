class MysteryLunch < ApplicationRecord
  has_many :mystery_lunch_employee_relation
  has_many :employees, through: :mystery_lunch_employee_relation

end
