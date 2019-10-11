require 'fog/core'
require 'fog/xml'
require 'fog/json'

require File.expand_path("../cloudian/version", __FILE__)

$:.unshift(File.dirname(__FILE__))

module Fog
  module Cloudian
    extend Fog::Provider

    autoload :Admin, File.expand_path('../cloudian/admin', __FILE__)
    autoload :Storage, File.expand_path('../cloudian/storage', __FILE__)

    service(:admin, 'Admin')
    service(:storage, 'Storage')

    class Error < StandardError; end
    # Your code goes here...
  end
end
