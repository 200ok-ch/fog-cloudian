module Fog
  module Cloudian
    class IAM
      class Real
        # require 'fog/cloudian/parsers/iam/create_user'

        def create_user(user_name, group_name)
          request(:put, 'user', { userId: user_name,
                                  groupId: group_name,
                                  userType: 'User' })
        end
      end
    end
  end
end
