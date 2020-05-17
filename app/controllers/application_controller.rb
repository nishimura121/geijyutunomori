class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex, :address, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :address, :hp_address, :sns_address, :self_introduction, :email, :profile_image])
    end


private

    # ログイン後のリダイレクト先
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.class == Admin
        admin_root_path
      else
        new_user_path
      end
    end

    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope.class == Admin
      	new_admin_session_path
      else
        new_user_session_path
      end
    end
end
