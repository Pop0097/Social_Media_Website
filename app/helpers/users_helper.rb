module UsersHelper
  def avatar_for(user, options = {size: 80})
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size, class: 'avatar-image'
    else
      image_tag "default_avatar.jpg", width: size, class: 'avatar-image'
    end
  end

  #method allows current user to follow "other"
  def follow(other)
    active_follows.create(followed_id: other.id)
  end

  #method allows current user to unfollow "other"
  def unfollow(other)
    active_follows.find_by(followed_id: other.id).destroy
  end

  #returns true if the current user is following "other"
  def following?(other)
    following.include?(other)
  end
  
end
