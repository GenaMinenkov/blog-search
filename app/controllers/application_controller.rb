class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    User.first
  end

  rescue_from ActiveRecord::RecordNotFound do
    render :not_found, body: 'Record not found'
  end
end
