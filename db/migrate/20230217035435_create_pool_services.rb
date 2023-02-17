class CreatePoolServices < ActiveRecord::Migration[6.1]
  def change
    create_table :pool_services do |t|
      t.datetime :date
      t.references :pools, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true

      t.timestamps
    end
  end
end
