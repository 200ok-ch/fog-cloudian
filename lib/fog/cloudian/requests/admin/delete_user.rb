module Fog
  module Cloudian
    class Admin
      class Real
        def delete_user(user_name, group_name)
          request(:delete, 'user', nil, { userId: user_name, groupId: group_name })
          # the response is 200 with an empty body
        end
      end
    end
  end
end
