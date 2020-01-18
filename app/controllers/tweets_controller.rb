class TweetsController < ApplicationController

    get "/tweets" do 
        @tweets = Tweet.all
        erb :"/tweets/tweets"
    end 

    get "/tweets/new" do 
        erb :"/tweets/new"
    end 

    post "/tweets" do 
        binding.pry
        # @tweet = Tweet.create(:content => params[:content])
        erb :"/tweets/tweets"
    end 
end
