class CreatePurposeFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :purpose_flights do |t|
      t.string :name
      t.string :nick

      t.timestamps
    end
  end
end
