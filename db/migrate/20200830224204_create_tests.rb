class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.date :day
      t.integer :tested
      t.integer :positive

      t.timestamps
    end
  end
end
