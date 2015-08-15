#!/bin/bash
ALEXA_HOME=/opt/alexa-home
cd $ALEXA_HOME
source .alexa-home-env.sh
cd server
bundle exec ruby app.rb &
cd ..
cd scraper
bundle exec ruby watir-login.rb &
