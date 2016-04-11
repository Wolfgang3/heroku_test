class NotifyMail < ApplicationMailer
	default from: "gudeamit148@gmail.com"


	def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
