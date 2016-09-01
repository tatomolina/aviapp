class CreatePlaneClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :plane_classes do |t|
      t.string :name
      t.string :nick

      t.timestamps
    end
  end
end
