module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/update_user'

        def update_user(user_name, group_name, user_details)
          request(:post, 'user', { userId: user_name,
                                  groupId: group_name,
                                  userType: 'User' })
        end
      end
    end
  end
end
