class CreatePools < ActiveRecord::Migration[6.1]
  def change
    create_table :pools do |t|
      t.string :address
      t.integer :size
      t.boolean :saltwater

      t.timestamps
    end
  end
end
