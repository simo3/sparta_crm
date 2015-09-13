class CustomersController < ApplicationController
#以下の一文で、ログインしないとcustomersのindexやshowなどにアクセスできないようにするdeviseのメソッド。
#authenticated_****で****部分はdeviseで作ったモデル名になる。今回はUserで作ったのでauthenticate_user!になる。
  before_action :authenticate_user!

#privteの中で記述した共有メソッドの呼び出し
#only[]内で適用したいメソッドをシンボル形式で指示して適用させる。
#
  before_action :search_customer, only:[:show, :edit, :update, :destroy]
  def index
    #@customers = Customer.page(params[:page])
    #下記がransackの導入
    #Customerからransackが引っ張ってきたデータをインスタンス変数qに代入
    #models/customer.rbのscopeで定義したものを挿入
    #ここでは「.company_order」
    @q = Customer.company_order.ransack(params[:q])
    #ransackのみなら@q.resultでOK
    #Kaminariが入っているとpage(params[:page]でKaminariに渡す)
    @customers = @q.result.page(params[:page])
  end

  def show
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
    #savaに成功、つまり上の@customer.saveがtrue
    #つまりshowをよびだしてページを表示
      redirect_to @customer
    else
    #saveに失敗、つまり上の@customer.saveがfalse
    #つまりnewにとどまり、再入力をさせる
      render :new
    end

    #redirect_to "/customers/#{@customer.id}"
  end

  def new
    @customer = Customer.new
  end



  def edit
  end

  def update
    @customer.update_attributes(customer_params)
    if @customer.save
      redirect_to customers_url(@customer)
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    #customers_urlはindexに戻るの意味
    #単数形のcustomer_urlにすると自分自身のshowメソッドに飛ぶ。
    redirect_to customers_url
  end

private
#各コントローラーに同じような記述がある場合はこちらにメソッドをまとめてコントローラーを軽量化。
#定義したメソッドは一番上で呼び出して使う。
  def search_customer
    @customer = Customer.find(params[:id])
  end
#以下がstrong parametersの記述
#カラムを追加した場合には、こちらに項目を追加しないとDBにデータが保存されない。
#
#
#
#

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
    )
  end
end
