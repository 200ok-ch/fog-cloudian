module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/create_user'

        def create_user(user_name, group_name)
          request(:put, 'user', { userId: user_name,
                                  groupId: group_name,
                                  userType: 'User' })
        end
      end
    end
  end
end
