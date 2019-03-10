class ResgistrationMailer < ApplicationMailer
  def successs_msg member
    @comment = "Hi, #{member.email}. Welcome to join us."
    mail to: member.email, subject: "Resgistration Result"
  end
end
