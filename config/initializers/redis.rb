# $redis = Redis.new(host: 'localhost', port: 6379)

  $redis = Redis.new(url: ENV["REDIS_URL"])

	logger.debug "In redis.rb file - Rails.env: " + Rails.env.to_s

	# if Rails.env == 'production'
	#   $redis = Redis.new(url: ENV["REDIS_URL"])
	# else
	#   $redis = Redis.new(url: ENV["REDIS_URL"])
	# end

	# if Rails.env.development?
	# 	$redis = Redis.new(url: ENV["REDIS_URL"])
	#   config.action_mailer.smtp_settings = {
	#     user_name: ENV["GMAIL_USERNAME_DEV"]
	#   }
	# end

	# if Rails.env.test?
	# 	$redis = Redis.new(url: ENV["REDIS_URL"])
	#   config.action_mailer.smtp_settings = {
	#     user_name: ENV["GMAIL_USERNAME_TEST"]
	#   }
	# end

	# if Rails.env.production?
	# 	$redis = Redis.new(url: ENV["REDIS_URL"])
	#   config.action_mailer.smtp_settings = {
	#     user_name: ENV["GMAIL_USERNAME"]
	#   }
	# end