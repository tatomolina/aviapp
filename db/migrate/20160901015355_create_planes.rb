class CreatePlanes < ActiveRecord::Migration[5.0]
  def change
    create_table :planes do |t|
      t.string :manufacturer
      t.string :model

      t.timestamps
    end
  end
end
