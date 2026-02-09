require 'sinatra/base'
require 'gossip'

class ApplicationController < Sinatra::Base

  # Page d'accueil : liste tous les gossips
  get '/' do
    gossips = Gossip.all
    erb :index, locals: { gossips: gossips }
  end

  # Formulaire de création d'un nouveau gossip
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Réception du formulaire et sauvegarde du gossip
  post '/gossips/new/' do
    gossip = Gossip.new(
      params["gossip_author"],
      params["gossip_content"]
    )
    gossip.save
    redirect '/'
  end

  # Page "show" d'un gossip : /gossips/:id
  get '/gossips/:id' do
    id = params['id'].to_i
    gossip = Gossip.find(id)
    erb :show, locals: { gossip: gossip, id: id }
  end

  # Formulaire d'édition d'un gossip
  get '/gossips/:id/edit/' do
    id = params['id'].to_i
    gossip = Gossip.find(id)
    erb :edit, locals: { gossip: gossip, id: id }
  end

  # Réception du formulaire d'édition et mise à jour en CSV
  post '/gossips/:id/edit/' do
    id = params['id'].to_i

    Gossip.update(
      id,
      params["gossip_author"],
      params["gossip_content"]
    )

    redirect "/gossips/#{id}"
  end

  # Suppression d'un gossip
  post '/gossips/:id/delete/' do
    id = params['id'].to_i
    Gossip.delete(id)
    redirect '/'
  end
end
