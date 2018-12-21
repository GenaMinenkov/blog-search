class LikesCreateService
  LIKES_PER_USER_LIMITATION = 5

  def initialize(post, user)
    @user ||= user
    @post ||= post
  end

  def call
    check_users_likes_count!

    Like.create(post: post, user: user)
  end

  private

  attr_reader :user, :post

  def check_users_likes_count!
    raise ::UserLikesCountExceedError if user.likes.count >= LIKES_PER_USER_LIMITATION
  end
end
