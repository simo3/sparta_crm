class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#deviseでは新しいカラムを追加してもcontrollerのストロングパラメーターは設定せず、ここに記述する。以下は定型みたいなもの。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
#devise/registrations/new.html.erbに項目を増やすため
#「新規登録」画面に適用
    devise_parameter_sanitizer.for(:sign_up) << :family_name
    devise_parameter_sanitizer.for(:sign_up) << :gien_name
#devise/registrations/edit.html.erbに項目を増やすため
#「設定変更」画面に適用
    devise_parameter_sanitizer.for(:account_update) << :family_name
    devise_parameter_sanitizer.for(:account_update) << :gien_name
  end
end
