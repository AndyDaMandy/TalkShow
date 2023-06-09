# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

   # include Pagy::Backend

    protected

    # t.string "first_name"
    #t.string "last_name"
    #t.string "words_to_live_by"
    #t.integer "age"
    #t.string "location"
    #should I add about?
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :words_to_live_by, :age, :location, :avatar])
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :email, :password, :current_password)}
    end
end
