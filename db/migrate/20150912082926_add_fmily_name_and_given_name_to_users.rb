class AddFmilyNameAndGivenNameToUsers < ActiveRecord::Migration
  #Usersモデルにfamily_nameとgiven_namenameを作成した
  def change
    add_column :users, :family_name, :string
    add_column :users, :gien_name, :string
  end
end
