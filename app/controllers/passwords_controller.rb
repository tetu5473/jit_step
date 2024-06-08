class PasswordsController < Devise::PasswordsController
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    Rails.logger.debug "Password reset errors: #{resource.errors.full_messages.join(", ")}" # デバッグ情報

    yield resource if block_given?

    if resource.errors.empty?
      flash[:notice] = "パスワードが正常に変更されました。"
      respond_with_navigational(resource) { redirect_to after_resetting_password_path_for(resource) }
    else
      flash.now[:alert] = resource.errors.full_messages.join(", ") # エラーメッセージを詳細に表示
      set_minimum_password_length
      respond_with_navigational(resource) { render :edit }
    end
  end

  private

  def resource_params
    params.require(:user).permit(:password, :password_confirmation, :reset_password_token)
  end
end
