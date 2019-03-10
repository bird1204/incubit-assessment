class Members::ResgistrationsController < ApplicationController
  before_action :build_member

  def create
    sign_up(@member)
    flash[:success] = "Welcome to join us !!!"
    redirect_to edit_member_path(@member.id)
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "#{e}"
    redirect_back fallback_location: new_session_path 
  end

  private

  def resgistration_params
    params.require(:member).permit(:email, :password, :password_confirmation)
  rescue ActionController::ParameterMissing => e
    Hash.new
  end

  def build_member
    @member = Member.new resgistration_params
    
  end
end
