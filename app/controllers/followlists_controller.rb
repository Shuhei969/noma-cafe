class FollowlistsController < ApplicationController
  before_action :authenticate_user!
  def show
    user_ids = current_user.followings.pluck(:id)
    @profiles = Profile.where(user_id: user_ids)
  end
end