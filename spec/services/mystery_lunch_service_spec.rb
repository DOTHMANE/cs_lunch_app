require 'rails_helper'

RSpec.describe MysteryLunchService, type: :model do
  subject(:process) { described_class.new.process }
  let(:department_a) { create(:department, name: 'employee department a') }
  let(:department_b) { create(:department, name: 'employee department b') }
  let(:department_c) { create(:department, name: 'employee department c') }

  describe 'process' do
    # First scenario:
    # 6 employees, 3 per department wish leads to 3 mystery lunches 2 employees each
    context 'Scenario 1' do
      before do
        create_list(:employee, 3, department: department_a)
        create_list(:employee, 3, department: department_b)
      end
      it 'creates 3 mystery lunch' do
        expect { process }.to change(MysteryLunch, :count).by(3)
      end
      it 'creates 6 mystery lunch employee relation' do
        expect { process }.to change(MysteryLunchEmployeeRelation, :count).by(6)
      end
    end

    # Second scenario:
    # 6 employees, 2 per department wish leads to 2 mystery lunches 3 employees each
    context 'Scenario 2' do
      before do
        create_list(:employee, 2, department: department_a)
        create_list(:employee, 2, department: department_b)
        create_list(:employee, 2, department: department_c)
      end
      it 'creates 3 mystery lunch' do
        expect { process }.to change(MysteryLunch, :count).by(2)
      end
      it 'creates 6 mystery lunch employee relation' do
        expect { process }.to change(MysteryLunchEmployeeRelation, :count).by(6)
      end
    end
  end

end

