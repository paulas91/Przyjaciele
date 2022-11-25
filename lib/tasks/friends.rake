require_relative '../friends_manager'

namespace :friends do
  task fix_friends_and_users_associations: :environment do
    p "Fixing friends associations"
    user = User.find_by_email("paulinaskopp@gmail.com")
    FriendsManager.new.fix_friends_and_users_associations(user)
    p "Finished"
  end
end
