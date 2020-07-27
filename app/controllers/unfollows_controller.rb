class UnfollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.unfollow!(params[:acount_id])
    redirect_to acount_path(params[:acount_id])
  end
end