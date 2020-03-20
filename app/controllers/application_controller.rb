class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :date
  before_action :basic_auth

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def date
    today = Date.today
    @year = today.year
    @month = today.month
    @day = today.day
    @week = %w{日 月 火 水 木 金 土}[today.wday]
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'aaaa' && password == '1111'
    end
  end
end