class CreateClimbs < ActiveRecord::Migration[6.0]
  def change
    create_table :climbs do |t|
      t.bigint :route_id
      t.string :name
      t.string :type
      t.string :rating
      t.float :stars
      t.integer :pitches
      t.float :lat
      t.float :lng
      t.string :url

      t.timestamps
    end
  end
end
