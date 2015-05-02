# http [![Build Status](https://travis-ci.org/evertrue/http-cookbook.svg)](https://travis-ci.org/evertrue/http-cookbook)

Provides a useful set of Resources for making HTTP Requests in a chefy way

# Requirements

* chef... pretty simple right?

# Resources

## `http_request`

```
# Verify that the website is working... otherwise fix it
http_request 'ensure website is working' do
 url 'http://edhurtig.ninja'
 notifies :restart, 'service[nginx]'
 notifies :restart, 'service[hhvm]'
 # notifies :say, 'slack[oh #### web server crashed]'
end
```

```
# Verify that the website is working... otherwise fix it
http_request 'post some junk somewhere' do
 url 'https://api.northeastern.me/nova/v2/servers'
 method 'POST'
 user 'edhurtig' # Should probs get this from a Bag
 pass 'SuperSecurePasswordFromAnEncryptedDataBag'
 headers { 'Content-Type' => 'application/json' }
 body '{ "instance_name" : "ubuntu zilly-zoo", ... }'
end
```


## `http_get`

Might happen

## `http_post`

Might happen

# Usage

Include this recipe in a wrapper cookbook:

```
depends 'http', '~> 1.0'
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests with `kitchen test`, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author:: Eddie Hurtig (eddie@hurtigtechnologies.com)
