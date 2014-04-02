pingu
=====

Pingu is a Heroku app pinger that prevents your dynos from falling asleep.

Kinda like that horrible guard guy on Reykjavik airport.

![Pingu](http://www-groups.dcs.st-and.ac.uk/~robertt/robsweb/pingu2t.gif)

#Usage (recommended)

1. Clone pingu. Run `npm install`.
2. Create a pingu user.
2. Save your Heroku API token somewhere in pingu user's `${HOME}` and make sure you
   limit access (only make it readable by pingu)! You can source it in your pingu user `~/.bashrc` file.
3. Create a Cron job that runs pingu and pass it the Heroku token. Something like:

        HEROKU_API_KEY=${HEROKU_API_KEY} ${HOME}/pingu/node_modules/.bin/coffee ${HOME}/pingu

4. PROFIT!
