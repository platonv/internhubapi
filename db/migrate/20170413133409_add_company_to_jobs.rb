class AddCompanyToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company_id, :integer
    add_index  :jobs, :company_id
  end
end
