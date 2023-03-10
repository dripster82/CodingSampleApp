# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :check_concurrent_session

  # POST /resource/sign_in
  def create
    super
    set_login_token
    set_flash_message!(
      :message,
      :last_signed_in,
      date: current_user.last_sign_in_at,
      ip: current_user.last_sign_in_ip
    )
  end

  private

  def set_login_token
    token = Devise.friendly_token
    session[:login_token] = token
    current_user.current_login_token = token
    current_user.save
  end
end
