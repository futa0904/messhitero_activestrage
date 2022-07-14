class ApplicationController < ActionController::Base
    
    before_action :authenticate_user!, except: [:top]
    before_action :yaya_parameter, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        user_path(current_user)
    end
    
    def after_sign_out_for(resource)
        about_path
    end
    
    protected
    def yaya_parameter
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
