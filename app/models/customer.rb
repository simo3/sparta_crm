# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  family_name :string           not null
#  given_name  :string           not null
#  email       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :integer
#
# Indexes
#
#  index_customers_on_company_id  (company_id)
#  index_customers_on_email       (email) UNIQUE
#

class Customer < ActiveRecord::Base
#以下で、company id順に表示する指示
#:company_id順に並び変えるという:company_orderをコントローラーで呼び出す
  scope :company_order, -> {order(:company_id)}
  #アソシエーション設定
  #Customerは一つのCompanyに所属する
  belongs_to :company
#明示的に「CustomerはたくさんのCommentsを持つ」と記述
  has_many :comments
  validates :family_name, presence: true, length: {maximum: 20}
  validates :given_name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :company_name, presence: true
  #def full_name
    #full_name = family_name + '　' + given_name + '様'
    #returnは省略するのがRuby
    #return以降を全部省略することも可
    #return full_name
  def full_name(keisyo)
    #(引数)を追加した形
    full_name = family_name + '　' + given_name + keisyo
  end
end
