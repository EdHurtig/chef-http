action :run do
  require 'net/http'
  require 'uri'

  uri = URI.parse(new_resource.url)

  http = Net::HTTP.new(uri.host, uri.port)

  http.use_ssl = uri.is_a?(URI::HTTPS)
  http.verify_mode = new_resource.ssl_verify

  # Will print response.body
  case new_resource.method
  when 'GET'
    Net::HTTP::Get.new(uri.request_uri)
  when 'HEAD'
    Net::HTTP::Head.new(uri.request_uri)
  when 'POST'
    Net::HTTP::Post.new(uri.request_uri)
  when 'PATCH'
    Net::HTTP::Patch.new(uri.request_uri)
  when 'PUT'
    Net::HTTP::Put.new(uri.request_uri)
  when 'PROPPATCH'
    Net::HTTP::Proppatch.new(uri.request_uri)
  when 'LOCK'
    Net::HTTP::Lock.new(uri.request_uri)
  when 'UNLOCK'
    Net::HTTP::Unlock.new(uri.request_uri)
  when 'OPTIONS'
    Net::HTTP::Options.new(uri.request_uri)
  when 'PROPFIND'
    Net::HTTP::Propfind.new(uri.request_uri)
  when 'DELETE'
    Net::HTTP::Delete.new(uri.request_uri)
  when 'MOVE'
    Net::HTTP::Move.new(uri.request_uri)
  when 'COPY'
    Net::HTTP::Copy.new(uri.request_uri)
  when 'MKCOL'
    Net::HTTP::Mkcol.new(uri.request_uri)
  when 'TRACE'
    Net::HTTP::Trace.new(uri.request_uri)
  end

  request.basic_auth(new_resource.user, new_resource.pass) if new_resource.user
  request.body = new_resource.body if new_resource.body

  new_resource.headers.each do |header, value|
    request[header] = value
  end

  response = http.request(request)

  new_resource.updated_by_last_resource?(new_resource.notifies_code_range.include?(response.code))
end
