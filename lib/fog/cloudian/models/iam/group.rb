module Fog
  module Cloudian
    class IAM
      class Group < Fog::Model

        identity :id, :aliases => 'GroupId'

        attribute :arn,   :aliases => 'Arn'
        attribute :name,  :aliases => 'GroupName'
        attribute :path,  :aliases => 'Path'
        attribute :users, :aliases => 'Users', :type => :array
      end
    end
  end
end
