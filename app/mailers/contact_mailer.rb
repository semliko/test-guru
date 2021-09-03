class ContactMailer < ApplicationMailer
  default from: ENV['SMTP_USERNAMNE']

  def contact_us_email
    @admin_email = ENV['SMTP_USERNAMNE']
    @email_data = params[:email_data]
    @contact_url  = contact_url(params[:email_data])
    mail(to: @admin_email, subject: 'Contact Admin New Email')
  end
end
