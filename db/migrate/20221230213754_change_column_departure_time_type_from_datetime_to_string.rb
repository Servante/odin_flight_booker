class ChangeColumnDepartureTimeTypeFromDatetimeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :departure_time, :string
  end
end
