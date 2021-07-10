class AddOmniPicToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :omni_pic, :string
  end
end
