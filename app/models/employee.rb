class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
end
