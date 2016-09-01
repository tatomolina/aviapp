class CreateHours < ActiveRecord::Migration[5.0]
  def change
    create_table :hours do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :user, foreign_key: true
      t.references :purpose_flight, foreign_key: true
      t.references :plane_registration, foreign_key: true
      t.integer :landings

      t.timestamps
    end
  end
end
