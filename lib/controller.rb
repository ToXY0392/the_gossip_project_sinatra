require 'sinatra/base'
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  # Page d'accueil : liste des potins
  get '/' do
    gossips = Gossip.all
    erb :index, locals: { gossips: gossips }
  end

  # Nouveau potin : formulaire
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Nouveau potin : traitement du formulaire
  post '/gossips/new/' do
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    redirect '/'
  end

  # Afficher un potin
  get '/gossips/:id' do
    id = params['id'].to_i
    gossip = Gossip.find(id)

    halt 404, "Gossip not found" unless gossip

    erb :show, locals: { gossip: gossip, id: id }
  end

  # Formulaire d'édition d'un potin
  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    gossip = Gossip.find(id)

    halt 404, "Gossip not found" unless gossip

    erb :edit, locals: { gossip: gossip, id: id }
  end

  # Traitement du formulaire d'édition
  post '/gossips/:id/edit/' do
    id = params['id'].to_i
    Gossip.update(id, params['gossip_author'], params['gossip_content'])
    redirect "/gossips/#{id}"
  end

  # (optionnel) suppression si tu l'as dans ton exo
  post '/gossips/:id/delete/' do
    id = params['id'].to_i
    Gossip.delete(id) if Gossip.respond_to?(:delete)
    redirect '/'
  end

  run! if app_file == $0
end
