module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/set_password'

        def set_password(user_name, group_name, password)
          request(:post, 'user', { userId: user_name,
                                   groupId: group_name,
                                   password: password })
        end
      end
    end
  end
end
