class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :destination_name
      t.string :destination_address
      t.float :lat
      t.float :lng
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
