# EM-SKKServ

EventMachine based SKKServ.

## Installation

Add this line to your application's Gemfile:

    gem 'em-skkserv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install em-skkserv

## Usage

```ruby
require 'em-skkserv'

class YuiSKK < EM::SKKServ::Server
  def on_request(kana)
    if kana == 'ゆい'
      send_data EM::SKKServ::ServerMessage.new(:found, :kanji => ['ゆい(*-v・)ゆい']).to_s
    else
      send_data EM::SKKServ::ServerMessage.new(:not_found).to_s
    end
  end
end

EM.run do
  EM.start_server "127.0.0.1", 1178, YuiSKK
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
