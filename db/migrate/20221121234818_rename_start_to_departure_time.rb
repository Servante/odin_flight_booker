class RenameStartToDepartureTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :start, :departure_time
  end
end
