module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/create_credentials'

        def create_credentials(user_name, group_name)
          request(:put, 'user/credentials', { userId: user_name,
                                              groupId: group_name })
        end
      end
    end
  end
end
