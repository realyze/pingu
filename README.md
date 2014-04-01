pingu
=====

Heroku app pinger. Lists all your apps and pings them (i.e., sends a HTTP GET
request) for you.

### Usage

1. Clone pingu. Run `npm install`.
2. Save your Heroku API token somewhere, e.g. `/etc/default/`...make sure you
   limit access (only make it readable by root)!
3. Create a Cron job that runs pingu and pass it the Heroku token.
4. PROFIT!
