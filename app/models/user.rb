class User < ActiveRecord::Base
  
  
  has_many  :shouts

  has_many :text_subjects,
    through: :shouts

  has_many :followed_user_relationships,
    class_name: "FollowingRelationship",
    foreign_key: :follower_id

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    class_name: "FollowingRelationship",
    foreign_key: :followed_user_id

  has_many :followers, 
    through: :follower_relationships


  def follow(other_user)
    followed_users << other_user
  end

  def unfollow(other_user)
    followed_users.delete(other_user)
  end

  def following?(other_user)
    followed_user_ids.include?(other_user.id)
  end

  def timeline
   Shout.where(user_id: followed_users).order('created_at desc')
  end

  def to_param
    name
  end

end
