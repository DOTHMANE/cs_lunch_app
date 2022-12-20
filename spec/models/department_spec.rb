require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:department) { create(:department, name: 'employee department') }
  let!(:employee) { create(:employee, department: department) }

  describe 'attributes' do
    it 'is valid with valid attributes' do
      expect(department).to be_valid
    end

    it { is_expected.to respond_to(:name) }

    describe '#name' do
      it 'is required' do
        expect(employee).to validate_presence_of(:name)
      end
    end
  end

  describe 'associations' do
    it 'has_many employees' do
      expect(department.employees.count).to eq(1)
    end
  end
end
