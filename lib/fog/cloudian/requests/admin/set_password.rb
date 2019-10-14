module Fog
  module Cloudian
    class Admin
      class Real
        def set_password(user_name, group_name, password)
          # POST /user/password Create or change a user's CMC password
          #
          # Minimum of nine characters, maximum of 64 characters
          # Must contain at least three of these four types of characters:
          #   o Lower case letters
          #   o Upper case letters
          #   o Numbers
          #   o Special characters such as !, @, #, $, %, ^, etc.

          request(:post, 'user/password', nil, { userId: user_name,
                                                 groupId: group_name,
                                                 password: password })

          # This returns a 200 with an empty body.
          #
          # Unless the user does not exist then you'll get a...
          #
          #   "204 User does not exist"
          #
          # ROFLMAO.
        end
      end
    end
  end
end
