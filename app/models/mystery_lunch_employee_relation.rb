class MysteryLunchEmployeeRelation < ApplicationRecord
  belongs_to :mystery_lunch
  belongs_to :employee

  scope :last_three_months, ->(date_max, date_min) { where('created_at <= ? AND created_at >= ?', date_max, date_min) }
end
