module TwitterClient
  def client
    @_client ||= Twitter::Client.new(
      oauth_token: oauth_token,
      oauth_token_secret: oauth_secret
    )
  end

  def method_missing(name, *args)
    client.respond_to?(name) ? client.__send__(name, *args) : super
  end

  def respond_to_missing?(name, include_private)
    include_private ? client.methods.include?(name) : client.respond_to?(name)
  end
end
