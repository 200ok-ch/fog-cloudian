module Fog
  module Cloudian
    class Admin
      class Real
        def delete_user(user_name, group_name)
          request(:delete, 'user', nil, { userId: user_name, groupId: group_name })
          # NOTE: in contrast to the documentation this may also
          # return a `409 Conflict`
        end
      end
    end
  end
end
