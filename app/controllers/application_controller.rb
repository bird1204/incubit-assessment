class ApplicationController < ActionController::Base
  def authenticate_member!
    return if session[:member_id].present?
    flash[:notice] = '請先登入會員' 
    redirect_back fallback_location: root_path
  end

  def sign_up resource
    resource.save!
    resource.send_welcome_mail
    sign_in(resource)
  end

  def sign_in resource
    session[:member_id] = resource.id
  end

  def sign_out resource
    session[:member_id] = nil
  end
end
