module Api
  class TweetsController < ApiController

    def index
      @tweets = Tweet.find_all_following_tweets_by_user(current_user)

      render :index
    end

    def create
      @tweet = current_user.tweets.new(tweet_params)

      if @tweet.save
        render :new_tweet
      else
        flash.now[:errors] ||= []
        flash.now[:errors] << 'Invalid Tweet!'
        render json: { message: 'Invalid Tweet!' }
      end
    end

    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy!

      render json: @tweet
    end

    private
      def tweet_params
        params.require(:tweet).permit(:content)
      end
  end
end
