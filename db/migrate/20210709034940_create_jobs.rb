class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job_address_street
      t.string :job_address_land
      t.string :picture
      t.string :description
      t.string :services
      t.string :service_date
      t.integer :employee_id
      t.integer :user_id

      t.timestamps
    end
  end
end
