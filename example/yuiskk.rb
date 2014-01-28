#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$: << '../lib'

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
