module Api
  class FollowsController < ApiController
    def index
      @follows = current_user.out_follows

      render json: @follows.as_json(only: [:id, :followee_id])
    end

    def create
      @follow = current_user.out_follows.create!(
        followee_id: params[:followee_id]
      )

      render json: @follow
    end

    def destroy
      @follow = Follow.find(params[:id])
      @follow.destroy!

      render json: @follow
    end
  end
end
