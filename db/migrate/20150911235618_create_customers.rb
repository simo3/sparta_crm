class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      #「,」に続けて「空入力はダメ」、「20文字数」
      t.string :family_name, null: false,length: {maximum: 20}
      t.string :given_name,  null: false,length: {maximum: 20}
      t.string :email,       null: false

      t.timestamps null: false
    end
    #create_tableが終わったら
    #検索されやすいように目次を設定
  add_index :customers, :email, unique: true
  end

end
