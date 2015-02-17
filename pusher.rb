require 'sinatra'
require 'pusher'

Pusher.app_id = '107544'
Pusher.key = '3c5b5ffb49fe35b8d7bd'
Pusher.secret = 'a27b0a0996119dcdf528'


get '/' do
  erb :index, :layout => :layout
end

post '/' do

end
