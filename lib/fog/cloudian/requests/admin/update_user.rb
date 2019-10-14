module Fog
  module Cloudian
    class Admin
      class Real
        def update_user(user_details)
          # The `user_details` must either have `canonicalUserId` XOR
          # (`userId` AND `groupId`). @cloudian: What are you doing?
          if user_details["canonicalUserId"]
            user_details.delete("userId")
            user_details.delete("groupId")
          end

          request(:post, 'user', user_details)
        end
      end
    end
  end
end
