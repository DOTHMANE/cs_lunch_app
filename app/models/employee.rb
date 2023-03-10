class Employee < ApplicationRecord
  belongs_to :department
  has_one_attached :photo
  has_many :mystery_lunch_employee_relation
  has_many :mystery_lunches, through: :mystery_lunch_employee_relation

  validates :department, presence: true
  validates :name, presence: true

  after_commit :add_default_cover, on: [:create]
  after_create :assign_new_employee

  scope :active, -> { where(status: 1) }

  def assign_new_employee
    MysteryLunch.assign_odd_employee(self)
  end

  def assign_partner
    current_lunch = mystery_lunches.last

    return if current_lunch.full?

    partner = current_lunch.employees.where.not(id:).first
    MysteryLunch.assign_odd_employee(partner)
    current_lunch.destroy
  end

  def suspended
    update!(status: 0)
    assign_partner
  end

  private

  def add_default_cover
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "user.png")), filename: 'user.png' , content_type: "image/png")
    end
  end
end
