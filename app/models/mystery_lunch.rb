class MysteryLunch < ApplicationRecord
  has_many :mystery_lunch_employee_relation, dependent: :destroy
  has_many :employees, through: :mystery_lunch_employee_relation

  scope :current_month, -> { where('created_at <= ? AND created_at >= ?', Time.now.end_of_month, Time.now.beginning_of_month) }

  def self.assign_odd_employee(employee)
    return unless employee.present?

    current_month.each do |lunch|
      next if lunch.full?
      next if lunch.employees.pluck(:department_id).include? employee.department.id

      lunch.mystery_lunch_employee_relation.create(employee_id: employee.id)
      break
    end
  end

  def full?
    employees.count == 3
  end
end
