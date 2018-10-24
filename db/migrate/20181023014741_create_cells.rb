class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.string :color_code
      t.integer :row
      t.integer :column
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
