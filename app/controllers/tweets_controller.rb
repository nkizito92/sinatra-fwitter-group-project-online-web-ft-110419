class TweetsController < ApplicationController

    get "/tweets" do 
        @tweets = Tweet.all
        if logged_in?
            erb :"/tweets/tweets"
        else 
            redirect "/login"
        end
    end
     
# create
    get "/tweets/new" do 
        if logged_in?
            erb :"/tweets/new"
        else  
            redirect '/login'
        end 
    end 

    post "/tweets" do 
        
        @tweet = Tweet.new(content: params[:content])
        @tweet.user_id = current_user.id
          if @tweet.content == ""
            redirect "/tweets/new"
          else 
             @tweet.save
             redirect "/tweets/#{current_user.id}"
          end 
    end 
    
    # read
    get "/tweets/:id" do 
        if logged_in?
            @tweet = Tweet.find_by(user_id: current_user.id)
            erb :"/tweets/show_tweet"
        else 
            redirect "/login"
        end
    end 

    # Update
    get "/tweets/:id/edit" do
        # if tweet.user_id doesn't match current_user.id
        # redirect to /tweets
        tweet = Tweet.find_by_id(params[:id])
        if logged_in? && current_user.id == tweet.user_id 
            redirect "/tweets/#{tweet.user_id}"
        else 
            redirect "/tweets"
        end 
    end 

    patch "/tweets/:id" do 
        @tweet = Tweet.find_by_id(params[:id])
        redirect "/tweets/#{@tweet.id}"
    end 



    
    delete "/tweets/:id" do 
        @user = User.find_by(username: params[:username])
        @tweet = Tweet.create(:content => params[:content])
        redirect "/tweets/#{@tweet.id}"
    end 

end
