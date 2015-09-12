class Customer < ActiveRecord::Base
  #アソシエーション設定
  #Customerは一つのCompanyに所属する
  belongs_to :company
  validates :family_name, presence: true, length: {maximum: 20}
  validates :given_name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
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
