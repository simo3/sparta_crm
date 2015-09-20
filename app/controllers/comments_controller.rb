class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
#リダイレクト先はcustomer_urlで指定
#@customer_idで紐付けられたcommentを持つページにリダイレクト
    redirect_to customer_url(@comment.customer_id)
  end

  def destroy
    #以下のまま行くと、@commentはdestroyされるのでcustomer_idが取れなくなる
    #@comment = Comment.find(params[:id])
    #@comment.destroy
    @comment = Comment.find(params[:id])
    #取得した@commentのcustomer_idを一旦変数customer_idに代入
    customer_id = @comment.customer_id
    @comment.destroy
    #先ほど代入した変数customer_idを使ってリダイレクト先のurlを確保すると、そのままのページに戻れる。
    redirect_to customer_url(customer_id)
  end


  private
  def comment_params
    params.require(:comment).permit(
      :body,
      :customer_id,
      :user_id
    )
  end
end
