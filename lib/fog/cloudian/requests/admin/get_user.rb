module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/get_user'

        def get_user(user_name, group_name)
          request(:get, 'user', { userId: user_name,
                                  groupId: group_name })
        end
      end
    end
  end
end
