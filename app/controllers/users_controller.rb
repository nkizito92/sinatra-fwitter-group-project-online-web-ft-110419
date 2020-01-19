class UsersController < ApplicationController

    get '/' do 
        erb :"/users/login"
    end 

    
    get '/signup' do 
        if logged_in?
            redirect "/tweets"
        else 
            erb :"/users/create_user"
        end
    end 
    
    post '/signup' do 
        @user = User.new(:username => params[:username], :password => params[:password], :email => params[:email])
        @user.save
        session[:user_id] = @user.id
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
            redirect "/tweets"
        else
            redirect "/signup"
        end
    end

    get '/login' do 
          erb :"/users/login"
    end 
    
    post '/login' do 
        @user = User.find_by(username: params[:username])
		redirect "/tweets"
    end 

    helpers do
		
		def current_user
			User.find(session[:user_id])
		end

        def logged_in?
			!!session[:user_id]
		end
	end

end 
