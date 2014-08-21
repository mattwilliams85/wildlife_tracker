class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.column :name, :varchar
    end
  end
end
