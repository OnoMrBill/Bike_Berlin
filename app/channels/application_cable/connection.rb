module ApplicationCable
	# The connection.rb file can be used to run any sort of code before 
	# the connection between a user and the server is established. 
	# This can be useful for authentication, for example. 
	# Here you can authenticate the users who are able to connect to the ActionCable server.
  class Connection < ActionCable::Connection::Base
  end
end
