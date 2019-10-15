require 'fog/aws'

module Fog
  module Cloudian

    # this is just a shim, as cloudian provides a s3 compatible api
    Storage = Fog::AWS::Storage

    # If need be we could still repoen the class and override methods
    # to account for any idiosyncracies.

  end
end
