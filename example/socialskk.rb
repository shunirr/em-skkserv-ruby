#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$: << '../lib'

require 'em-skkserv'
require 'open-uri'

class SocialSKK < EM::SKKServ::Server
  def on_request(kana)
    data = open("http://www.social-ime.com/api/?string=#{URI.escape(kana)}").read
    kanji = data.split "\t"
    if kanji.size > 0
      found kanji, 'EUC-JP'
    else
      not_found
    end
  end
end

EM.run do
  EM.start_server "127.0.0.1", 1178, SocialSKK
end
