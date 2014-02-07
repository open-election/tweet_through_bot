#clock.rb
require 'clockwork'
require 'twitter'

include Clockwork

INTERVAL = ENV['INTERVAL'].to_i
TWITTER_CONSUMER_KEY = 'L6CuOVjdAwt7eQ7Oc0uGVQ' # ENV['TWITTER_CONSUMER_KEY'] 
TWITTER_CONSUMER_SECRET = 'fyZQoh6s5orzjoyM7MNoMpLt6XFmmDf2ZtAPFbbmeco' #ENV['TWITTER_CONSUMER_SECRET']
TWITTER_ACCESS_TOKEN = '2331477745-UqRT7K0Rghuxh8YYPi3luHDqmsK52BLps3pKqLA' # ENV['TWITTER_ACCESS_TOKEN']
TWITTER_ACCESS_SECRET = 'teImnjibQpYtE9gwq7KNI5S7FpT7cZfiAxe9baFqKW55g' #ENV['TWITTER_ACCESS_SECRET']

postClient = Twitter::REST::Client.new do |config|
  config.consumer_key = TWITTER_CONSUMER_KEY
  config.consumer_secret = TWITTER_CONSUMER_SECRET
  config.access_token = TWITTER_ACCESS_TOKEN
  config.access_token_secret = TWITTER_ACCESS_SECRET
end

tweets = []

handler do |job|
  puts "Running #{job}, INTERVAL : #{INTERVAL}"
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = TWITTER_CONSUMER_KEY
    config.consumer_secret = TWITTER_CONSUMER_SECRET
  end
  #client = settings.twitter_client
  client.search("to:uraieiri ", :count => 100).each do |tweet|
    # t = {:id => tweet.id, :uri => tweet.uri, :text => tweet.text, :favorited => tweet.favorited}
    # if tweet.media[0]
    #   t[:photo_uri] = tweet.media[0].media_uri.to_s
    # end
    begin
      unless tweets.include?(tweet.id) then
        postClient.update(tweet.text.gsub(/\@.*?\s/, ''))
        p "posting #{tweet.id} is done."
        tweets << tweet.id
      end
    rescue Twitter::Error::AlreadyPosted => e 
      p e
    end
    # p tweet.text.gsub(/\@.*?\s/, '')
  end
  # p tweets.to_json
  p "Getting tweet done."
end

every(INTERVAL.seconds, 'tweet.job')
