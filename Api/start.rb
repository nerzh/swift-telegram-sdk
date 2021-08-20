#!/bin/env ruby

script_file_path = File.expand_path(File.dirname(__FILE__))
system("cd #{script_file_path} && rm -f tg-api.html || true")
system("cd #{script_file_path} && curl https://core.telegram.org/bots/api > tg-api.html")
system("cd #{script_file_path} && ruby generate_wrappers.rb")