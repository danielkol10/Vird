class AddCoordinatesToVacuum < ActiveRecord::Migration[5.2]
  def change
    add_column :vacuums, :latitude, :float
    add_column :vacuums, :longitude, :float
  end
end
