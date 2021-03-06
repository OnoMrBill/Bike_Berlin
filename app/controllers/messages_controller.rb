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
    logger.debug "MessagesController @name: #{@name}"
    logger.debug "MessagesController @email: #{@email}"
    logger.debug "MessagesController @content: #{@content}"    
    if @message.valid?
     	UserMailer.contact_form(@email, @name, @content).deliver_now
      render :action => 'thank_you'
    else
      render :action => 'new'
    end
  end

end
