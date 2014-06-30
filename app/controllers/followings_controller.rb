class FollowingsController < ApplicationController
 def show
   @followed_users = current_user.followed_users
 end 
end
