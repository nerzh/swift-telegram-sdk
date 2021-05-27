#!/bin/sh
rm -f tg-api.html
wget https://core.telegram.org/bots/api -O api.html
ruby generate_wrappers.rb