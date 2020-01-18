class UsersController < ApplicationController

    get '/' do 
        erb :"/users/login"
    end 

    post '/login' do 
        binding.pry
        erb :"/tweets/tweets"
    end 
    
    get '/signup' do 
        erb :"/users/create_user"
    end 

    post '/signup' do 
        @user = User.new(:username => params[:username], :password => params[:password])
        redirct :"/views/tweets"
    end 
end 
