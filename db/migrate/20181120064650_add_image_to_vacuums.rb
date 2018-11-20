class AddImageToVacuums < ActiveRecord::Migration[5.2]
  def change
    add_column :vacuums, :image, :string
  end
end
