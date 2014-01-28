require 'eventmachine'
require "em-skkserv/version"

module EventMachine
  module SKKServ
    autoload :Server,        'em-skkserv/server'
    autoload :ServerMessage, 'em-skkserv/server_message'
    autoload :ClientMessage, 'em-skkserv/client_message'
  end
end
