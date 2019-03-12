class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :find_member
  def update
    @member.update_attributes!(member_params)
    flash[:success] = "record saved"
    redirect_to edit_member_path(@member.id)
  end

  private

  def member_params
    params.require(:member).permit(:email, :password, :password_confirmation, :username)
  end

  def find_member
    @member = Member.find(params[:id])
    raise ActiveRecord::RecordNotFound if @member.blank?
  end
end
