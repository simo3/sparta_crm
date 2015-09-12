class AddCompanyIdToCustomers < ActiveRecord::Migration
  def change
    #これで外部キー設定
    add_reference :customers, :company, index: true, foreign_key: true
  end
end
