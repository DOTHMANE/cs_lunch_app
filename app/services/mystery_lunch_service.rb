class MysteryLunchService

  def initialize
    # tmp vars to help with the process
    @assigned_employees = []
    @assigned_departments = []

    # employees grouped by department
    @employees_to_assign = Employee.active.pluck(:department_id, :id)
                                   .shuffle
                                   .group_by(&:shift)
                                   .transform_values(&:flatten)
  end

  def process
    assign_employees
    assign_odd_employees
  end

  private

  # process to create mystery lunch and assign employees
  def assign_employees
    @employees_to_assign.each do |department, employees|
      employees.each do |employee|
        next if @assigned_employees.include?(employee)

        @employees_to_assign.each do |compared_department, compared_employees|
          next if department == compared_department || @assigned_departments.include?(compared_department)

          compared_employees.each do |compared_employee|
            next if @assigned_employees.include?(compared_employee)
            next if MysteryLunchEmployeeRelation.had_lunch_last_three_months?(employee, compared_employee)

            lunch = MysteryLunch.create

            lunch.mystery_lunch_employee_relation.create(employee_id: employee)
            lunch.mystery_lunch_employee_relation.create(employee_id: compared_employee)

            @assigned_employees.push(employee, compared_employee)

            break
          end
          break if @assigned_employees.include?(employee)
        end
      end
      @assigned_departments.push(department)
    end
  end

  # to assign odd employees that weren't assigned in the first process
  def assign_odd_employees
    return if (odd_employees = Employee.active.pluck(:id) - @assigned_employees).empty?

    odd_employees.each do |odd_employee_id|
      MysteryLunch.assign_odd_employee(Employee.find(odd_employee_id))
    end
  end
end

