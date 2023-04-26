class ChangeBookingIdToBeIntegerInPassengers < ActiveRecord::Migration[7.0]
  def up 
    change_column :passengers, :booking_id, 'integer USING CAST(booking_id AS integer)'
  end

  def down
    change_column :passengers, :booking_id, 'integer USING CAST(booking_id AS integer)'
  end
end
  