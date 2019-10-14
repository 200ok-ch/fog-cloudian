module Fog
  module Cloudian
    class Admin
      class Real
        def get_user(user_name, group_name)
          request(:get, 'user', nil, { userId: user_name,
                                       groupId: group_name })
          # this returns an "user object" in JSON
        end
      end
    end
  end
end
