#!/bin/sh
rm -f tg-api.html || true
curl https://core.telegram.org/bots/api > tg-api.html
ruby generate_wrappers.rb