module Fog
  module Cloudian
    class IAM < Fog::Service

      requires :user, :password
      recognizes :host, :port, :path, :persistent, :ssl_verify_peer

      request_path 'fog/cloudian/requests/iam'

      request :create_group
      request :delete_group

      request :create_user
      request :delete_user

      # request :create_credentials
      # request :get_group
      # request :get_user
      # request :set_group_qos
      # request :set_user_qos


      # model_path 'fog/cloudian/models/iam'
      # model       :group
      # collection  :groups
      # model       :user
      # collection  :users

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
