class TweetsController < ApplicationController

    get "/tweets" do 
        @tweets = Tweet.all
        redirect "/tweets"
    end 

    get "/tweets/new" do 
        erb :"/tweets/new"
    end 

    post "/tweets" do 
        @user = User.find_by(username: params[:username])
        binding.pry
        # @tweet = Tweet.create(:content => params[:content])
        erb :"/tweets/tweets"
    end 
end
