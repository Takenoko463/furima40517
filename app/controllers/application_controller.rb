class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD'] # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nick_name, :name_last_w, :name_first_w, :name_last_r, :name_first_r,
                                             'birth_day(1i)', 'birth_day(2i)', 'birth_day(3i)'])
  end
end
