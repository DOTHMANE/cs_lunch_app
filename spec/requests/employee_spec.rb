require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let(:department) { create(:department) }

  describe "GET /index" do
    it "renders the index template" do
      get  employees_path
      expect(response).to render_template("index")
    end

    it "returns a 200" do
      get  employees_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /create" do
    let(:params) { { employee: { department_id: department.id, name: 'test' } } }

    it "creates the employee and redirects to employee view" do
      post  employees_path, params: params
      expect(Employee.last.name).to eq( 'test' )
      expect(response).to redirect_to( employee_url(Employee.last))
    end

    it "returns a 302" do
      post  employees_path, params: params
      expect(response).to have_http_status(:found)
    end
  end

  describe "PATCH /update" do
    let(:employee) { create(:employee, department: create(:department)) }
    let(:params) { { employee: { name: 'test update' } } }

    it "updates the employee and redirects to employee view" do
      patch  employee_path(employee.id), params: params
      expect(employee.reload.name).to eq('test update')
      expect(response).to redirect_to(employee_url(employee))
    end

    it "returns a 200" do
      get  employees_path
      expect(response).to have_http_status(:ok)
    end
  end
end
