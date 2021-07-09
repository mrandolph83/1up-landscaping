class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.integer :job_id

      t.timestamps
    end
  end
end
