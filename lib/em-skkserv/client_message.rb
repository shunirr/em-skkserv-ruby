module EventMachine
  module SKKServ
    class ClientMessage
      COMMANDS = [
        :close,
        :request,
        :version,
        :host,
        :abbrev,
      ]

      def self.parse(data)
        data.force_encoding('EUC-JP')
        command_index = data[0].to_i
        end_position = data.index("\\") || data.index("\n") || data.index(" ")
        kana = data[1 .. (end_position - 1)]
        kana.encode!('UTF-8', 'EUC-JP')
        { :command => COMMANDS[command_index], :kana => kana }
      end
    end
  end
end
