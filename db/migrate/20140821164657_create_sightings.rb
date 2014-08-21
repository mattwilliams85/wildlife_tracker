class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.column :location_id, :int
      t.column :species_id, :int

      t.timestamps
    end
  end
end
