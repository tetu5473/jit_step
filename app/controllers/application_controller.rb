class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # ユーザーログイン後にリダイレクトするパスを指定
    def after_sign_in_path_for(resource)
      users_dash_boards_path # これはダッシュボードへのパスです
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation])
    end

    private

    # ユーザーログアウト後にリダイレクトするパスを指定
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path # ログインページへのパス
    end
end
