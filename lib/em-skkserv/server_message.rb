module EventMachine
  module SKKServ
    class ServerMessage
      COMMANDS = {
        :error     => ?0,
        :found     => ?1,
        :not_found => ?4,
      }

      def initialize(command, params = {})
        @command = COMMANDS[command]
        @kanji = params[:kanji]
        @encoding = params[:encoding]
      end

      def to_s
        if @kanji
          kanji = @kanji
          if @encoding != 'EUC-JP'
            kanji.map! {|k| k.encode!('EUC-JP', @encoding) }
          end
          "#{@command}/#{kanji.join('/')}/\n"
        else
          "#{@command}\n"
        end
      end
    end
  end
end
