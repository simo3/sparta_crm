class AddFmilyNameAndGivenNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :family_name, :string
    add_column :users, :gien_name, :string
  end
end
