class Member < ApplicationRecord
  has_secure_password
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true,
                    presence: true

  validates :password, presence: true, 
                       confirmation: { case_sensitive: true }, 
                       length: { minimum: 8 }, 
                       on: :create

  validates :username, length: { minimum: 5 }, 
                       on: :update, 
                       if: Proc.new { |resource| resource.username != email.split('@')[0] }

  before_save :downcase_email
  before_create :init_attributes

  RESET_MAIL_VALID_HOUR = 6

  def send_welcome_mail
    ResgistrationMailer.successs_msg(self).deliver_now
  end

  def send_reset_mail
    PasswordMailer.forget(self).deliver_now
  end

  def create_reset_password_token
    update_attributes!(
      reset_password_token: new_token,
      reset_password_sent_at: Time.zone.now
    )
  end

  def reset_password new_password, token
    raise Error::IncorrectTokenError if password_reset_expired? or not valid_password_reset_token?(token)
    update_attributes!(password: new_password)
  end

  private

  def new_token
    SecureRandom.urlsafe_base64
  end

  def init_attributes
    self.username = self.email.split('@')[0]
  end

  def downcase_email
    self.email = self.email.downcase
  end

  def password_reset_expired?
    reset_password_sent_at < RESET_MAIL_VALID_HOUR.hours.ago
  end

  def valid_password_reset_token? token
    reset_password_token == token
  end
end
