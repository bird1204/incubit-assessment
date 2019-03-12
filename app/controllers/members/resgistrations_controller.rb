class Members::ResgistrationsController < ApplicationController
  before_action :build_member

  def create
    sign_up(@member)
    flash[:success] = "Welcome to join us !!!"
    redirect_to edit_member_path(@member.id)
  end

  private

  def resgistration_params
    params.present? ? params.require(:member).permit(:email, :password, :password_confirmation) : Hash.new
  end

  def build_member
    @member = Member.new resgistration_params
  end
end
