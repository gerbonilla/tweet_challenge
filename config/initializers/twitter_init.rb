@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['T_KEY']
  config.consumer_secret     = ENV['T_SECRET']
  config.access_token        = ENV['T_ACCESS_TOKEN']
  config.access_token_secret = ENV['T_ACCESS_TOKEN_SECRET']
end
