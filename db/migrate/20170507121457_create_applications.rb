class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.belongs_to :job, index: true
      t.belongs_to :student, index: true
      t.datetime :application_date
      t.timestamps
    end
  end
end
