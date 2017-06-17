class UserMailer < ApplicationMailer
	default from: "bill.fennell@gmail.com"

	def contact_form(email, name, message)
  	@message = message
    mail(from: email,
         to: 'bill.fennell@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
