class TweetsController < ApplicationController

    get "/index" do 
        @tweets = Tweet.all
        redirect "/tweets"
    end 

    get "/tweets/new" do 
        erb :"/tweets/new"
    end 

    post "/tweets/:id" do 
        @user = User.find_by(username: params[:username])
        @tweet = Tweet.create(:content => params[:content])
        redirect "/tweets#{@tweet.id}"
    end 
end
