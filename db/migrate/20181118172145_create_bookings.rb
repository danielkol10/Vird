class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :rent_duration
      t.references :user, foreign_key: true
      t.references :vacuum, foreign_key: true

      t.timestamps
    end
  end
end
