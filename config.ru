require 'bundler'
Bundler.require

# On ajoute le dossier lib au LOAD_PATH
$:.unshift File.expand_path("./lib", __dir__)

require 'controller'

run ApplicationController
