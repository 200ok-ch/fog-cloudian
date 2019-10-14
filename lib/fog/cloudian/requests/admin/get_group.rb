module Fog
  module Cloudian
    class Admin
      class Real
        def get_group(group_name)
          request(:get, 'group', nil, { groupId: group_name })
          # this returns a "group object" in JSON
        end
      end
    end
  end
end
