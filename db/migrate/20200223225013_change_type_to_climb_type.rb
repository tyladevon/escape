class ChangeTypeToClimbType < ActiveRecord::Migration[6.0]
  def change
    rename_column :climbs, :type, :climb_type
  end
end
