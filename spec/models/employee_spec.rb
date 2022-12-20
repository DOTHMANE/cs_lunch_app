require 'rails_helper'

RSpec.describe Employee, type: :model do
  let!(:department) { create(:department, name: 'employee department') }
  let!(:employee) { create(:employee, department: department) }
  let!(:department_b) { create(:department, name: 'employee department b') }
  let!(:employee_b) { create(:employee, department: department_b) }
  let!(:mystery_lunch) { create(:mystery_lunch) }
  let!(:lunch_employee_a) { create(:mystery_lunch_employee_relation, employee: employee, mystery_lunch: mystery_lunch) }
  let!(:lunch_employee_b) { create(:mystery_lunch_employee_relation, employee: employee_b, mystery_lunch: mystery_lunch) }

  describe 'attributes' do
    it 'is valid with valid attributes' do
      expect(employee).to be_valid
    end

    it { is_expected.to respond_to(:department_id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:status) }


    describe '#name' do
      it 'is required' do
        expect(employee).to validate_presence_of(:name)
      end
    end

    describe '#department_id' do
      it 'is required' do
        expect(employee).to validate_presence_of(:department)
      end
    end
  end

  describe 'associations' do
    it 'belongs to one department' do
      expect(employee.department.name).to eq('employee department')
    end

    it 'has many mystery_lunches' do
      expect(employee.mystery_lunches.count).to eq(1)
    end
  end

  describe '.add_default_cover' do
    it 'sets a default photo to employees' do
      employee.send(:add_default_cover)

      expect(employee.reload.photo.attached?).to eq(true)
    end
  end

  describe '.assign_new_employee' do
    it 'assigns new employee to a mystery lunch' do
      new_employee = create(:employee, department: create(:department))

      expect(new_employee.reload.mystery_lunches.count).to eq(1)
    end
  end
end
