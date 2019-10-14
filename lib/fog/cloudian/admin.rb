module Fog
  module Cloudian
    class Admin < Fog::Service

      requires :user, :password
      recognizes :host, :port, :path, :persistent, :ssl_verify_peer

      request_path 'fog/cloudian/requests/admin'

      # group
      request :create_group
      request :get_group
      request :delete_group

      # user
      request :create_user
      request :get_user
      request :update_user
      request :delete_user
      request :set_password
      request :create_credentials

      # qos
      request :set_qos_limits

      # model_path 'fog/cloudian/models/admin'
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
                     headers: {"Accept" => "application/json"},
                     ssl_verify_peer: @ssl_verify_peer }
          @connection = Fog::Core::Connection.new(url, @persistent, params)
        end

        def request(method, path, payload, query=nil)
          # NOTE: on success cloudian always returns a 200, they don't
          # know any other status codes, nor redirects
          params = { method: method, path: path, expects: [200] }
          params[:body] = Fog::JSON.encode(payload) if payload
          params[:query] = query if query

          response = @connection.request(params)

          if response.body.empty?
            :success_with_empty_body
          else
            case response.headers['Content-Type']
            when /^application\/json/
              # puts response.body
              Fog::JSON.decode(response.body)
            else
              response.headers['Content-Type']
            end
          end
          # rescue Excon::Errors::HTTPStatusError => error
          #   error
        end
      end

      class Mock
        def initialize(options={})
        end
      end
    end
  end
end
