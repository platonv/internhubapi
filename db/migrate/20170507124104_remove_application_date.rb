class RemoveApplicationDate < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :application_date
  end
end
