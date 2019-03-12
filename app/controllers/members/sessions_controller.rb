class Members::SessionsController < ApplicationController
  def create
    @member = Member.find_by(
      email: params[:session][:email]
    )
    if verify?
      sign_in(@member)
    else
      raise Error::IncorrectInformationError
    end
    flash[:success] = "Welcome Back #{@member.username} !!!"
    redirect_to edit_member_path(@member.id)
  end

  def destroy
    sign_out(@member)
    flash[:success] = "You have logout, enter login page."
    redirect_to new_session_path
  end

  private

  def verify?
    @member.present? and verify_recaptcha(model: @member) and @member.authenticate(params[:session][:password])
  end
end
