class ProductChannel < ApplicationCable::Channel
	# Be sure to restart your server when you modify this file. 
	# Action Cable runs in a loop that does not support auto reloading.	

  def subscribed
    # stream_from "some_channel"
    stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

 	# In order for all your users to actually see updates on the channel they subscribed to, 
 	# they need to "stream" from it. In your product_channel.rb file, add stream_from "product_channel" 
 	# inside the subscribed method. Now, if users subscribe to the channel, they start "streaming" 
 	# all the updates (much like watching a live stream on the internet).  
end
