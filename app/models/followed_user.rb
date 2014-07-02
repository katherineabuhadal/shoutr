class FollowedUser < ActiveRecord::Base

  has_many :users
  has_many :shouts, 
    through: :users

  def shouts

  end
end
