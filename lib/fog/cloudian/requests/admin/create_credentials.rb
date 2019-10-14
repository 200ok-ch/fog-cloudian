module Fog
  module Cloudian
    class Admin
      class Real
        def create_credentials(user_name, group_name)
          request(:put, 'user/credentials', nil, { userId: user_name,
                                                   groupId: group_name })
          # this returns "credentials object" in JSON
        end
      end
    end
  end
end
