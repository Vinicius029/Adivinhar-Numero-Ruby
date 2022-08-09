class Rendering
    attr_accessor :cursor

    module INPUT_OPTION
        DEFAULT = 0
        PLAY = 1
        GAME_INFO = 2
        EXIT = 3
    end

    def self.animacao(opc = INPUT_OPTION::DEFAULT)
        render_header if opc == INPUT_OPTION::PLAY
        render_load if opc == INPUT_OPTION::GAME_INFO
    end

    def self.render_menu
        loop do
            system('cls')
            animacao(1)
            puts 'Selecione uma das opções:'
            puts '1 - Jogar'
            puts '2 - Informação do jogo'
            puts '3 - Sair'
            opc = gets.chomp.to_i

            return opc if [INPUT_OPTION::PLAY, INPUT_OPTION::GAME_INFO, INPUT_OPTION::EXIT].include?(opc)
        end
    end

    def self.render_header
        File.open(File.expand_path('../../lib/desenhos/adivinhar.txt', __FILE__),'r')  do |arq|
            while line = arq.gets
                puts line
                sleep(1)
            end
        end
    end

    def self.render_load
        File.open(File.expand_path('../../lib/desenhos/carregando.txt', __FILE__),'r')  do |arq|
            while line = arq.gets
                puts line
                sleep(1)
            end
        end
    end

    def self.render_game_over
        File.open(File.expand_path('../lib/desenhos/gamerover.txt', __FILE__),'r')  do |arq|
            while line = arq.gets
                puts line
                sleep(0.75)
            end
        end
    end
end