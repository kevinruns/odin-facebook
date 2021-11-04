class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name, :string
  end
end
