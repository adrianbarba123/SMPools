class CreatePools < ActiveRecord::Migration[6.1]
  def change
    create_table :pools do |t|
      t.string :address
      t.integer :size
      t.boolean :saltwater

      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
