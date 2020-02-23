class CreateTripClimbs < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_climbs do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :climb, null: false, foreign_key: true

      t.timestamps
    end
  end
end
