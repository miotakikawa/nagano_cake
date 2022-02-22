class ApplicationController < ActionController::Base
    before_action :authenticate_customer!,except: [:top]
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,
        :email, :postal_code, :address, :telephone_number])
    end
    
    def after_sign_in_path_for(resource)
        root_path #とりあえずトップページ
    end
end
