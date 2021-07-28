class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      stored_location_for(resource)
    end
  end

  def default_url_option
    { lang: I18n.locale}
  end

  private

  def set_locale
    I18n.locale = I18n.locale_avalible?(params[:lang]) ? params(:lang) : I18n.default_locale
  end
end
