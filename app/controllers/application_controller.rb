# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_concurrent_session

  private

  def check_concurrent_session
    return unless already_logged_in?

    sign_out_and_redirect(current_user)
    flash.now[:notice] = 'You have been logged out, because you have logged in elsewhere'
  end

  def already_logged_in?
    current_user && session[:login_token] != current_user.current_login_token
  end
end
