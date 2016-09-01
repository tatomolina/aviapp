class CreatePlaneRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :plane_registrations do |t|
      t.string :prefix
      t.string :suffix
      t.integer :year
      t.references :plane, foreign_key: true
      t.references :plane_class, foreign_key: true

      t.timestamps
    end
  end
end
