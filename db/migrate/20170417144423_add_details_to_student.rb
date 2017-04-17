class AddDetailsToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    add_column :students, :birthday, :date
    add_column :students, :start_year, :int
  end
end
