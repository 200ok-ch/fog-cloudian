module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/set_qos_limits'

        def set_qos_limits(user_name, group_name)
          raise 'not implemented'
          #request(:put, 'user', { userId: user_name,
          #                        groupId: group_name,
          #                        userType: 'User' })
        end
      end
    end
  end
end
