# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    set_flash_message!(
      :message,
      :last_signed_in,
      date: resource.last_sign_in_at,
      ip: resource.last_sign_in_ip
)
  end
end
