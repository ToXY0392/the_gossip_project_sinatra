# controller.rb
require 'sinatra'
require 'csv'
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  set :root, File.dirname(__FILE__)

  # Pour afficher correctement les fichiers ERB
  set :views, Proc.new { File.join(root, "views") }

  ####################################
  # 👉 PAGE D’ACCUEIL = LISTE DES POTINS
  ####################################
  get '/' do
    gossips = Gossip.all
    erb :index, locals: { gossips: gossips }
  end

  ####################################
  # 👉 PAGE NEW POTIN
  ####################################
  get '/gossips/new' do
    erb :new_gossip
  end

  ####################################
  # 👉 TRAITEMENT FORMULAIRE NEW POTIN
  ####################################
  post '/gossips/new' do
    Gossip.new(params[:gossip_author], params[:gossip_content]).save
    redirect '/'
  end

  ####################################
  # 👉 PAGE D’UN POTIN (AVEC OU SANS / FINAL)
  ####################################
  get '/gossips/:id' do
    id = params[:id].to_i
    gossip = Gossip.find(id)
    erb :show, locals: { gossip: gossip, id: id }
  end

  # Si quelqu’un met un slash inutile → on redirige proprement
  get '/gossips/:id/' do
    redirect "/gossips/#{params[:id]}"
  end

  ####################################
  # 👉 PAGE POUR EDITER UN POTIN
  ####################################
  get '/gossips/:id/edit' do
    id = params[:id].to_i
    gossip = Gossip.find(id)
    erb :edit, locals: { gossip: gossip, id: id }
  end

  ####################################
  # 👉 TRAITEMENT EDIT
  ####################################
  post '/gossips/:id/edit' do
    Gossip.update(params[:id].to_i, params[:gossip_author], params[:gossip_content])
    redirect "/gossips/#{params[:id]}"
  end

  ####################################
  # 👉 SUPPRESSION D'UN POTIN
  ####################################
  post '/gossips/:id/delete' do
    Gossip.delete(params[:id].to_i)
    redirect '/'
  end

end
