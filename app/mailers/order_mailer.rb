class OrderMailer < ApplicationMailer
	def welCome order
		@order = order
   
    	mail(to: order.Email, subject: 'Welcome to My Awesome Site')
  	end
end
