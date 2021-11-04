class FriendsController < ApplicationController
  def index
#   @user_names = User.pluck(:family_name)

    @user_names = User.all.map(&:full_name)

  end
end
