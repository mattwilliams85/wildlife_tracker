class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.column :name, :varchar
    end
  end
end
