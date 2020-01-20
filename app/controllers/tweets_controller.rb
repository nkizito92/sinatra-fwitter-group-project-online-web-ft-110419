class TweetsController < ApplicationController

    get "/tweets" do 
        @tweets = Tweet.all
        if logged_in?
            erb :"/tweets/tweets"
        else 
            redirect "/login"
        end
    end 

    get "/tweets/new" do 
        if logged_in?
            erb :"/tweets/new"
        else  
            redirect '/login'
        end 
    end 

    post "/tweets" do 
        @user = User.find_by_id(params[:id])
        @tweet = Tweet.create(content: params[:content], user_id: params(:user_id))
        @tweet.user_id = @user.id

    end 



    
    get "/tweets/:id/edit" do
        if !logged_in? 
            redirect "/login"
        else
           
            if tweet = current_user.tweets.find_by(params(:id))
                erb :"/tweets/edit_tweet"
            else  
                redirect "/tweets"
            end 
        end
    end 
    
    patch "/tweets/:id" do 
        @user = User.find_by(username: params[:username])
        @tweet = Tweet.create(:content => params[:content])
        redirect "/show_tweet/#{@tweet.id}"
    end 

end
