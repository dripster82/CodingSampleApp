# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_concurrent_session

  private

  def check_concurrent_session
    return unless already_logged_in?

    sign_out_and_redirect(current_user)
    # rubocop:disable Rails/ActionControllerFlashBeforeRender:
    flash[:notice] = I18n.t('signout_due_to_other_session')
    # rubocop:enable Rails/ActionControllerFlashBeforeRender:
  end

  def already_logged_in?
    current_user && session[:login_token] != current_user.current_login_token
  end
end
