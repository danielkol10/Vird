class ChangeDefaultValueToAvailableAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :vacuums, :available, :boolean, default: true
  end
end
