class Company < ActiveRecord::Base
  #アソシエーション設定
  #Companyは複数のcustomerを持つ
  has_many :customers
end
