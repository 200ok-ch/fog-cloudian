module Fog
  module Cloudian
    class Stroage < Fog::Service

      requires :user, :password
      recognizes :host, :port, :path, :persistent, :ssl_verify_peer

      request_path 'fog/cloudian/requests/storage'

      request :create_bucket
      request :set_bucket_policy
      request :set_bucket_acl
      request :set_bucket_logging
      request :set_bucket_versioning
      request :delete_bucket

      # model_path 'fog/cloudian/models/storage'
      # model       :bucket
      # collection  :buckets

      def initialize(options={})
        @options = options
      end

      class Real
        def initialize(options={})
          @user = options[:user]
          @password = options[:password]

          @host = options[:host]
          @port = options[:port]
          @path = options[:path] || '/'
          @persistent = options[:persistent] || false
          @ssl_verify_peer = true if options[:ssl_verify_peer] != false

          url = "https://#{@host}:#{@port}#{@path}"
          params = { user: @user,
                     password: @password,
                     # NOTE: cloudians error messages always seem to be HTML
                     # :headers => {"Accept" => "application/json"},
                     ssl_verify_peer: @ssl_verify_peer }
          @connection = Fog::Core::Connection.new(url, @persistent, params)
        end

        def request(method, path, payload, query=nil)
          params = { method: method, path: path }
          params[:body] = Fog::JSON.encode(payload) if payload
          params[:query] = query if query

          response = @connection.request(params)

          if response.body.empty?
            response
          else
            Fog::JSON.decode(response.body)
          end
          # rescue Excon::Errors::HTTPStatusError => error
        end
      end

      class Mock
        def initialize(options={})
        end
      end
    end
  end
end
