require 'sinatra'
require 'pusher'
require 'faraday'
require 'json'

Pusher.app_id = '107544'
Pusher.key = '3c5b5ffb49fe35b8d7bd'
Pusher.secret = 'a27b0a0996119dcdf528'

get '/' do
  erb :index, :layout => :layout
end

post '/' do
  Pusher.trigger('test_channel', 'message', {message: params['message']})
  params['message']
end

get '/spotify-search' do
  queryParameters = 'artist:' + params['artist'] + '+track:' + params['track']
  response = Faraday.get "https://api.spotify.com/v1/search?q=#{queryParameters}&type=track"
  content_type :json
  response.body
end
