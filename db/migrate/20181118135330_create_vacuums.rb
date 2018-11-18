class CreateVacuums < ActiveRecord::Migration[5.2]
  def change
    create_table :vacuums do |t|
      t.string :model
      t.integer :price
      t.string :address
      t.boolean :available, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
