require 'rails_helper'

RSpec.describe MysteryLunch, type: :model do
  let(:department) { create(:department, name: 'employee department') }
  let(:employee) { create(:employee, department: department) }
  let(:department_b) { create(:department, name: 'employee department b') }
  let(:employee_b) { create(:employee, department: department_b) }
  let(:mystery_lunch) { create(:mystery_lunch) }
  let!(:lunch_employee_a) { create(:mystery_lunch_employee_relation, employee: employee, mystery_lunch: mystery_lunch) }
  let!(:lunch_employee_b) { create(:mystery_lunch_employee_relation, employee: employee_b, mystery_lunch: mystery_lunch) }



  describe 'associations' do
    it 'has many employees' do
      expect(mystery_lunch.employees.count).to eq(2)
    end
  end

  describe '.assign_odd_employee' do
    let(:odd_employee) { create(:employee, department: create(:department)) }

    it 'assigns and odd employee to a mystery lunch' do

      expect{described_class.assign_odd_employee(odd_employee)}.to change(MysteryLunchEmployeeRelation, :count).by(1)
    end
  end

  describe '.full?' do
    it 'assigns and odd employee to a mystery lunch' do
      expect(mystery_lunch.full?).to eq(false)
    end
  end
end
