module Fog
  module Cloudian
    class Admin
      class Real
        def create_user(user_name, group_name, user_type='User')
          request(:put, 'user', { userId: user_name,
                                  groupId: group_name,
                                  userType: user_type })
          # this returns a "user object" as JSON
        end
      end
    end
  end
end
