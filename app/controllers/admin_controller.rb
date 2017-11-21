class AdminController < ApplicationController
    before_action :verify_is_admin
  
  
    private
  
    def verify_is_admin
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.has_role? :admin )
    end
  
  end