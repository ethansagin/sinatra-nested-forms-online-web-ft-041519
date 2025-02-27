require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      "Welcome to the Nested Forms Lab!"
    end
    
    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |deets|
             # binding.pry
        Ship.new(deets)
      end
      @ships = Ship.all

      erb :'pirates/show'
    end
    
  end
end