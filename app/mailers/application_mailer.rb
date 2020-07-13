class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def doneOrder order
	@order = order
	mail(to: order.Email, subject: 'Welcome to My Awesome Site')
  end
end
