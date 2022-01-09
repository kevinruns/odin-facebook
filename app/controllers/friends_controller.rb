class FriendsController < ApplicationController

  def index

    # get list of friends
    friend_1_ids = Friend.accepted.where(invited_id: current_user).pluck(:requester_id)
    friend_2_ids = Friend.accepted.where(requester_id: current_user).pluck(:invited_id)
    @friend_ids = friend_1_ids + friend_2_ids
    @friends = User.where(id: @friends_ids)

    # want to get list users that have invited current user
    # first get requester user ids
    @requester_ids = Friend.pending.where(invited_id: current_user).pluck(:requester_id)
    # then find user objects 
    @requested_users = User.where(id: @requester_ids)

    # want to get list users that current user has invited
    # first get requester user ids
    @invited_ids = Friend.pending.where(requester_id: current_user).pluck(:invited_id)
    @invited_users = User.where(id: @invited_ids)

    # all users except current and users already invited or who have requested
    # users_exclude = [current_user.id] + @requester_ids + @invited_ids
    users_exclude = [current_user.id] 
    @users = User.where.not(id: users_exclude )

  end

  def create
    #   @user_names = User.pluck(:family_name)
    @friend = Friend.new(requester: current_user, invited_id: params[:invited_param], status: 0)

    recipient = User.find_by(id: params[:invited_param])
    Notification.create(recipient: recipient, actor: current_user, action: 'requested_friend', notifiable: @friend)

    if @friend.save
      redirect_back(fallback_location: :index)
    else
      render :index
    end
  end

  def destroy
    @friend = Friend.find_by(requester_id: current_user.id, invited_id: params[:id])

    if @friend.nil?
      @friend = Friend.find_by(requester_id: params[:id], invited_id: current_user.id)
    end

    @friend.destroy
    redirect_back(fallback_location: :index)
    
  end


  def update

    @friend = Friend.find_by(requester_id: params[:id], invited_id: current_user.id, status: 0)
    if @friend.nil?
      @friend = Friend.find_by(requester_id: current_user.id, invited_id: params[:id], status: 0)
    end

    @friend.status = 1

    if @friend.save
      redirect_back(fallback_location: :index)
    else
      render :index
    end

  end

end
