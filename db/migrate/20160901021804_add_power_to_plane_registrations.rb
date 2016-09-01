class AddPowerToPlaneRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_column :plane_registrations, :power, :integer
  end
end
