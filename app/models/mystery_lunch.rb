class MysteryLunch < ApplicationRecord
  has_many :mystery_lunch_employee_relation
  has_many :employees, through: :mystery_lunch_employee_relation

  scope :current_month, -> { where(created_at: Date.current.beginning_of_month) }

  def full?
    employees.count == 3
  end

end
