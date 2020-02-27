class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.string :name
      t.bigint :rid
      t.string :summary
      t.string :difficulty
      t.integer :stars
      t.string :location
      t.float :length
      t.integer :ascent
      t.integer :descent
      t.float :lat
      t.float :lng
      t.string :url
      t.integer :high
      t.integer :low

      t.timestamps
    end
  end
end
