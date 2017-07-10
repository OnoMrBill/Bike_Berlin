# config/initlializers/redis.rb

# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)

if Rails.env.production?
	# $redis = Redis.new(url: ENV["REDIS_URL"])
	$redis = Redis.new
else
	$redis = Redis.new
	# $redis = Redis.new(:host => 'localhost', :port => 6379)
end
