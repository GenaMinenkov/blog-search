class LikesController < ApplicationController
  def create
    like = LikesCreateService.new(post, current_user).call

    if like.valid?
      head :created
    else
      render :unprocessable_entity, body: like.errors.full_messages.join(' ')
    end

  rescue ::UserLikesCountExceedError => error
    render :unprocessable_entity, body: error.message
  end

  def destroy
    like.destroy

    head :ok
  end

  private

  def post
    Post.find(params[:post_id])
  end

  def like
    Like.find(params[:id])
  end
end
