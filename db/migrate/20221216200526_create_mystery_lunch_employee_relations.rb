class CreateMysteryLunchEmployeeRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :mystery_lunch_employee_relations do |t|
      t.references :mystery_lunch, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
