class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	logger.debug "inside the landing_page method of StaticPagesController..."
  	# @featured_product = Product.first
  	@products = Product.limit(3)
  end

	# def thank_you
	#   @name = params[:name]
	#   @email = params[:email]
	#   @message = params[:message]
	#   ActionMailer::Base.mail(
	#   	from: @email,
	#     to: 'bill.fennell@gmail.com',
	#     subject: "A new contact form message from #{@name}",
	#     body: @message
	#     ).deliver_now
	# end

end
