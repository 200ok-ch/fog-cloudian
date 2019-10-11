module Fog
  module Cloudian
    class Admin
      class Real
        # require 'fog/cloudian/parsers/admin/create_group'

        def create_group(group_name)
          request(:put, 'group', { groupId: group_name })
          # NOTE: the response is a 200 and has an empty body *sigh*
        end
      end
    end
  end
end
