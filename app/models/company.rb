#gem annotateによって以下のモデルの項目と型が一覧で差し込まれる
#予測変換にも対応してくれる
# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  company_name :string           not null
#  url          :string
#  address      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ActiveRecord::Base
  #アソシエーション設定
  #Companyは複数のcustomerを持つ
  has_many :customers
end
