class Members::SessionsController < ApplicationController
  def create
    @member = Member.find_by(
      email: params[:session][:email]
    )
    raise ActiveRecord::RecordNotFound if @member.blank?
    raise ActiveRecord::RecordInvalid if not @member.authenticate(params[:session][:password])
    sign_in(@member)
    flash[:success] = "Welcome Back #{@member.username} !!!"
    redirect_to edit_member_path(@member.id)
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "#{e} : incorrect email or password"
    redirect_back fallback_location: new_session_path 
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = "#{e} : incorrect email or password"
    redirect_back fallback_location: new_session_path 
  end


  def destroy
    sign_out(@member)
    flash[:success] = "You have logout, enter login page."
    redirect_to new_session_path
  end
end
