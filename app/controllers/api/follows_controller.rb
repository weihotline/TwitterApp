module Api
  class FollowsController < ApiController
    def create
      @follow = current_user.out_@follows.create!(
        followee_id: params[:followee_id]
      )

      render json: @follow
    end

    def destroy
      @follow = Follow.find(params[:id])
      @follow.destroy!

      render json: @follow
    end

    def index
      @follow = current_user.out_@follows

      render :index
    end
  end
end
