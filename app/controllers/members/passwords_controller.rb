class Members::PasswordsController < ApplicationController
  before_action :find_member, only: [:forget, :update]

  def forget
    @member.create_reset_password_token
    @member.send_reset_mail
    flash[:success] = "check your email for recovery"
    redirect_to password_edit_members_path 
  end

  def update
    @member.reset_password(params[:session][:password], params[:session][:token])
    flash[:success] = "using your new password to login"
    redirect_to new_session_path 
  end

  private

  def find_member
    @member = Member.find_by(email: params[:session][:email])
    raise ActiveRecord::RecordNotFound if @member.nil?
  end
end