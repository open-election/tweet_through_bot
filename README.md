tweet_through_bot
============

requirements
-------------

- ruby 2.x
- heroku
- bundler installed

installtion
------------

```
> git clone git@github.com:open-election/tweet_through_bot.git
> cd tweet_through_bot
> bundle ins --path vendor/bundle
```

usage
------------

```
> export TWITTER_CONSUMER_KEY="TWITTER_CONSUMER_KEY"
> export TWITTER_CONSUMER_SECRET="TWITTER_CONSUMER_SECRET"
> export TWITTER_ACCESS_TOKEN="TWITTER_ACCESS_TOKEN"
> export TWITTER_ACCESS_SECRET="TWITTER_ACCESS_SECRET"
> bundle exec ruby bot.rb
or
> foreman start
```
