# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def customer_state #ログイン時アクティブであるか判断をするメゾット
    customer = Customer.find_by(email: params[:customer][:email])
    return unless customer.nil?
    return unless customer.valid_password?(params[:customer][:password])
    return unless customer.is_active?
    flash[:notice] = "退会済みです。再度ご登録ください"
    redirect_to new_customer_registration_path
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
