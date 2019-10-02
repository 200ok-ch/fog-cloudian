module Fog
  module Cloudian
    class IAM
      class Real
        def delete_group(group_name)
          request(:delete, 'group', nil, { groupId: group_name })
          # NOTE: the response is a 200 and has an empty body *sigh*
        end
      end
    end
  end
end
