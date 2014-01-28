module EventMachine
  module SKKServ
    class Server < EM::Connection
      def receive_data(data)
        message = ClientMessage.parse data
        method = "on_#{message[:command].to_s}"
        if message[:kana]
          __send__ method, message[:kana]
        else
          __send__ method
        end
        close_connection_after_writing
      end

      def on_close
      end

      def on_version
        send_data 'em-skkserv 0.1'
      end

      def on_host
        send_data '0.0.0.0'
      end

      def on_request(kana)
        send_data ServerMessage.new(:not_found).to_s
      end

      def on_abbrev(kana)
        send_data ServerMessage.new(:not_found).to_s
      end
    end
  end
end

