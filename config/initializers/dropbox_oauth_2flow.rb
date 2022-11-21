def authenticator
    client_id = "60xdctd367nkdoy"
    client_secret = "b7wr7g7mijs0l75"

    DropboxApi::Authenticator.new(client_id, client_secret)
  end