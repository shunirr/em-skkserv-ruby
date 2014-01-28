#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$: << '../lib'

require 'em-skkserv'

class Calc < EM::SKKServ::Server
  def on_request(kana)
    ret = nil
    if kana.start_with? '!'
      eval "ret = #{kana[1 .. (kana.size - 1)]}"
    end

    if ret
      found [ret.to_s]
    else
      not_found
    end
  end
end

EM.run do
  EM.start_server "127.0.0.1", 1178, Calc
end
