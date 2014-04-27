Q = require 'q'
request = require 'superagent'
Heroku = require 'heroku-client'

heroku = new Heroku token: process.env.HEROKU_API_KEY

ping = ->
  Q.ninvoke(heroku.apps(), 'list')
    .then (apps) ->
      urls = (app.web_url for app in apps)
      promises = urls.map (url) ->
        deferred = Q.defer()
        console.log "pinging #{url}"
        request.get(url).end (res) ->
          console.log "pingu has pinged #{url}"
          deferred.resolve()
        deferred.promise
      console.log "------------------"
      Q.all promises

    .then ->
      console.log "------------------"
      console.log "pinged all URLs"

    .fail (err) ->
      console.error err

    .done()

LOOP_INTERVAL = process.env.LOOP_INTERVAL or (1000 * 60 * 30)

if process.env.KEEP_RUNNING
  looper = ->
    ping()
    setTimeout ->
      looper()
    , LOOP_INTERVAL
  looper()
else
  ping()

