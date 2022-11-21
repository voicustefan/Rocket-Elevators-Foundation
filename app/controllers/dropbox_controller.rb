class DropboxController < ApplicationController
#       def set_customer
#         @customer = Customer.find(params[:id])
#       end
#
#       # Only allow a list of trusted parameters through.

    # def auth_callback
    #     client = DropboxApi::Client.new("sl.BS7izBZlj3VTq0MWy4p8LFFOXNHaWFd-QPgm5iZiS8UDpO035nsCPoVzyApa2ZkTtkz8yoTgjH1GatPqSVDDLkdNcDxpkqWnQyiuMS1bTf201vE16Buhcdx1DfvXhi4qYf3uT_r0y8eh")
    #     #=> #<DropboxApi::Client ...>
    #     client.list_folder ""
    #     #=> #<DropboxApi::Results::ListFolderResult ...>
    #     redirect_to dropbox_auth_url 
 
    # end

    def auth_callback
        client = DropboxApi::Client.new("sl.BS7izBZlj3VTq0MWy4p8LFFOXNHaWFd-QPgm5iZiS8UDpO035nsCPoVzyApa2ZkTtkz8yoTgjH1GatPqSVDDLkdNcDxpkqWnQyiuMS1bTf201vE16Buhcdx1DfvXhi4qYf3uT_r0y8eh")
       puts "client is: #{client}"
    end

    # Example call:
    # GET /dropbox/auth
    def auth
      url = authenticator.authorize_url :redirect_uri => redirect_uri
      redirect_to url
    end
  
    # Example call:
    # GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA

    # Example call:
    # GET /dropbox/index
    def get_token
        @client = DropboxApi::Client.new(session[:access_token])
        @result = @client.list_folder "/sample_folder"
        @entries = @result.entries
    end

    # Example call:
    # GET /dropbox/upload
    def upload
    end

    # Example call:
    # POST /dropbox/upload
    def upload_dropbox
        @client = DropboxApi::Client.new("sl.BS7izBZlj3VTq0MWy4p8LFFOXNHaWFd-QPgm5iZiS8UDpO035nsCPoVzyApa2ZkTtkz8yoTgjH1GatPqSVDDLkdNcDxpkqWnQyiuMS1bTf201vE16Buhcdx1DfvXhi4qYf3uT_r0y8eh")
        @client.upload "/sample_folder/#{params[:file].original_filename}", params[:file].read
        redirect_to dropbox_index_url
    end

    def redirect_uri
        uri = URI.parse(request.url)
        uri.path = dropbox_auth_callback_path
        uri.query = nil
        uri.to_s
    end

    def authenticatorGenerator
        DropboxApi::Authenticator.new("sl.BS3OOMCVJAnop-Pgdzc5v6yKPkwFYbF99vMTCdSQaYVUAW3_rqzOIS9cW7EPunDroC4ExBCQU7O8dSGVPwbuqR2WOT7KYb3gJ0kt8R1NZ1kzKcdX4g9XJfrwQU3Cu0iFvD8xdkY")
    end
   
    def authenticator
      client_id = "60xdctd367nkdoy"
      client_secret = "b7wr7g7mijs0l75"
  
      DropboxApi::Authenticator.new(client_id, client_secret)
    end
  
    def redirect_uri
      dropbox_auth_callback_url # => localhost:3001.dropbox.com/oauth2/authorize
    end
end

# client = DropboxApi::Client.new("sl.BS3OOMCVJAnop-Pgdzc5v6yKPkwFYbF99vMTCdSQaYVUAW3_rqzOIS9cW7EPunDroC4ExBCQU7O8dSGVPwbuqR2WOT7KYb3gJ0kt8R1NZ1kzKcdX4g9XJfrwQU3Cu0iFvD8xdkY")
#         result = client.list_folder "/sample_folder"
#         #=> #<DropboxApi::Results::ListFolderResult>
#         result.entries
#         #=> [#<DropboxApi::Metadata::Folder>, #<DropboxApi::Metadata::File>]
#         result.has_more?
#         #=> false


