module Fog
  module Cloudian
    class Admin
      class Real
        def delete_group(group_name)
          request(:delete, 'group', nil, { groupId: group_name })
          # the response is a 200 and has an empty body
        end
      end
    end
  end
end
