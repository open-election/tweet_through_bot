tweet_through_bot
============

requirements
-------------

- ruby 2.x
- bundler installed
- heroku (optional)

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

heroku
----------------

### deploy

```
> heroku config:add INTERVAL=60
> heroku config:add TWITTER_CONSUMER_KEY="TWITTER_CONSUMER_KEY"
> heroku config:add TWITTER_CONSUMER_SECRET="TWITTER_CONSUMER_SECRET"
> heroku config:add TWITTER_ACCESS_TOKEN="TWITTER_ACCESS_TOKEN"
> heroku config:add TWITTER_ACCESS_SECRET="TWITTER_ACCESS_SECRET"
> git push heroku master
```


### start
```
> heroku scale clock=1
```

### stop
```
> heroku scale clock=0
```
