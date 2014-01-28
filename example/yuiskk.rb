#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$: << '../lib'

require 'em-skkserv'

class YuiSKK < EM::SKKServ::Server
  def on_request(kana)
    if kana == 'ゆい'
      send_data EM::SKKServ::ServerMessage.new :found, :kanji => ['唯']
    else
      send_data EM::SKKServ::ServerMessage.new :not_found
    end
  end
end

EM.run do
  EM.start_server "127.0.0.1", 1178, YuiSKK
end