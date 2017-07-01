class MessagesController < ApplicationController

	def index
	end

	def show
	end

  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params[:message])
	  @name = @message.name
	  @email = @message.email
	  @content = @message.content    	
    if @message.valid?
	   	UserMailer.contact_form(@email, @name, @content).deliver_now
      render :action => 'thank_you'
    else
		  # @all = @name + ' ' + @email + ' ' + @content
    	# flash[:notice] = "#{@all}"
    	# flash[:notice] = "Name: #{@message.name}"
    	# redirect_to root_url
      render :action => 'new'
    end
  end

	# def thank_you
	  # @name = params[:name]
	  # @email = params[:email]
	  # @message = params[:content]
   #   	UserMailer.contact_form(@email, @name, @content).deliver_now
	# end	

end	
