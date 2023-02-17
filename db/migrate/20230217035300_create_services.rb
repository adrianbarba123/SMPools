class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.boolean :cleaning
      t.boolean :chemical_balance
      t.integer :quote

      t.timestamps
    end
  end
end
