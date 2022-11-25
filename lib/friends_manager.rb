class FriendsManager
  def fix_friends_and_users_associations(user)
    friends_without_user = Friend.where(user_id: nil)
    friends_without_user.each do |friend|
      friend.update(user: user)
    end
  end
end
