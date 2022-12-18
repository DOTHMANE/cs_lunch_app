class MysteryLunchEmployeeRelation < ApplicationRecord
  belongs_to :mystery_lunch
  belongs_to :employee

  scope :last_three_months, ->(date_max, date_min) { where('created_at <= ? AND created_at >= ?', date_max, date_min) }

  def self.had_lunch_last_three_months?(employee_a, employee_b)
    lunch_employees = last_three_months(Date.current.next_month, Date.current.months_ago(3)).pluck(:mystery_lunch_id,
                                                                                                   :employee_id)
                                                                                            .group_by(&:shift)
                                                                                            .transform_values(&:flatten)

    lunch_employees.values.include? [employee_a, employee_b] or lunch_employees.values.include? [employee_b, employee_a]
  end

end
