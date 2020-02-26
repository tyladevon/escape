class AddTripToHikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :hikes, :trip, null: false, foreign_key: true
  end
end
