module ApplicationHelper
  def member_sign_in?
    session[:member_id].present?
  end
end
