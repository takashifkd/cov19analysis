class CreatePcrTests < ActiveRecord::Migration[6.0]
  def change
    create_table :pcr_tests do |t|
      t.string :date, null: false, unique: true
      t.integer :tested, null: false
      t.integer :positive, null: false

      t.timestamps
    end
  end
end
