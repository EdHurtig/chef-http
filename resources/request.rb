attribute :group, kind_of: String
attribute :port, kind_of: Integer

attribute :url, kind_of: String
attribute :method, kind_of: String
attribute :ssl_verify, kind_of: OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT
attribute :notifies_code_range, kind_of: Array
attribute :headers, kind_of: Hash
attribute :body, kind_of: String
attribute :user, kind_of: String
attribute :pass, kind_of: String

default_action :run
