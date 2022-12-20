class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
  has_many :mystery_lunch_employee_relation
  has_many :mystery_lunches, through: :mystery_lunch_employee_relation

  validates :department, presence: true
  validates :name, presence: true
end
