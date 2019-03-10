class PasswordMailer < ApplicationMailer
  def forget resource
    @resource = resource

    mail to: resource.email, subject: 'Account Recovery'
  end
end
