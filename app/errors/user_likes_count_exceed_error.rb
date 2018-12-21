class UserLikesCountExceedError < StandardError
  def initialize(message = 'Can not create like for user')
    super
  end
end
