class UsersController < ApplicationController

    get '/' do 
        erb :"/users/login"
    end 

    
    get '/signup' do 
        erb :"/users/create_user"
    end 
    
    post '/signup' do 
        @user = User.new(:username => params[:username], :password => params[:password], :email => params[:email])
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            @user.save
            redirect "/tweets"
        elsif 
            redirect "/signup"
        end
    end

    get '/login' do 
        erb :"/users/login"
    end 
    
    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user.username == params[:username]
            redirect "/tweets"
        else 
            redirect "/login"
        end 

    end 

end 
