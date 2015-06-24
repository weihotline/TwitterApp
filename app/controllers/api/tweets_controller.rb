module Api
  class TweetsController < ApiController

    def index
      @tweets = Tweet.find_all_following_tweets_by_user(current_user)

      render :index
    end

    def create
      @tweet = current_user.tweets.create!(
        content: params[:content]
      )

      render json: @tweet
    end

    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy!

      render json: @tweet
    end
  end
end
