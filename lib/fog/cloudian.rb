require "fog/core"
require 'fog/xml'
require 'fog/json'

require File.expand_path("../cloudian/version", __FILE__)

$:.unshift(File.dirname(__FILE__))

module Fog
  module Cloudian
    extend Fog::Provider

    autoload :IAM, File.expand_path('../cloudian/iam', __FILE__)

    service(:iam, 'IAM')

    class Error < StandardError; end
    # Your code goes here...
  end
end
