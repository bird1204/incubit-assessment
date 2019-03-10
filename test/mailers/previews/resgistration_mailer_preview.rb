# Preview all emails at http://localhost:3000/rails/mailers/resgistration_mailer
class ResgistrationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/resgistration_mailer/successs_msg
  def successs_msg
    ResgistrationMailer.successs_msg
  end

end
