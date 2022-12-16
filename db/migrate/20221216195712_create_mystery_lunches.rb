class CreateMysteryLunches < ActiveRecord::Migration[7.0]
  def change
    create_table :mystery_lunches do |t|

      t.timestamps
    end
  end
end
