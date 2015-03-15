# -*- coding:utf-8 -*-
# How to use
# 
# bundle exec clockwork bot.rb

require 'bundler/setup'
require 'clockwork'
require 'twitter'

include Clockwork

INTERVAL = ENV['INTERVAL'].to_i
TWITTER_CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY'] 
TWITTER_CONSUMER_SECRET = ENV['TWITTER_CONSUMER_SECRET']
TWITTER_ACCESS_TOKEN = ENV['TWITTER_ACCESS_TOKEN']
TWITTER_ACCESS_SECRET = ENV['TWITTER_ACCESS_SECRET']

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
  client.search("to:uraieiri ", :count => 100).each do |tweet|
    begin
      unless tweets.include?(tweet.id) then
        postClient.update(tweet.text.gsub(/\@.*?\s/, ''))
        p "posting #{tweet.id} is done."
        tweets << tweet.id
      end
    rescue Twitter::Error::AlreadyPosted => e 
      tweets << tweet.id
      p e
      p "tweet id is #{tweet.id}."
    end
  end
  p "Getting tweet done."
end

every(INTERVAL.seconds, 'tweet.job')
