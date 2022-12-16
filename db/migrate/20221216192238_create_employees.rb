class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :department, null: false, foreign_key: true
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
