class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource) 
        home_top_path
    end

    def after_sign_out_path_for(resource) 
        home_top_path
    end

    # ユーザ名をDBに登録してくれる
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_introduction, :icon_img])
    end

    

end
