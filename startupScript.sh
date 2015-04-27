#!/bin/bash

#cd $ALEXA_HOME
cd server
exec ruby app.rb &
cd ..
cd scraper
exec ruby watir-login.rb &
