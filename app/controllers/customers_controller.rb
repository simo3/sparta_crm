class CustomersController < ApplicationController
  def index
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
    #savaに成功、つまり上の@customer.saveがtrue
      redirect_to @customer
    else
    #saveに失敗、つまり上の@customer.saveがfalse
      render :new
    end

    #redirect_to "/customers/#{@customer.id}"
  end

  def new
    @customer = Customer.new
  end



  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
    if @customer.save
      redirect_to customers_url(@customer)
    else
      render :edit
    end
  end

  def destroy
  end
private
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
    )
  end
end
