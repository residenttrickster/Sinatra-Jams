require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  # Show a list of all the artists
  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  # Show a form to create a new user
  get '/artists/new' do
    erb :new
  end

  # Show a page with the information for 1 artist
  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :show
  end

  # Create a new user & redirect to the profile for the new user
  post '/artists' do
    @artist = Artist.create(params[:artist])
    redirect "/artists/#{@artist.id}"
  end

  # Edit Form
  get '/artists/:id/edit' do
    @artist = Artist.find(params[:id])
    erb :edit
  end

  # Update and redirect to the profile 
  put '/artists/:id' do
    @artist = Artist.find(params[:id])
    @artist.update(params[:artist])
    redirect "/artists/#{@artist.id}"
  end

  # Delete 
  delete '/artists/:id' do
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect "/artists"
  end

end
