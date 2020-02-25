class AddLocationToClimbs < ActiveRecord::Migration[6.0]
  def change
    add_column :climbs, :location, :string
  end
end
