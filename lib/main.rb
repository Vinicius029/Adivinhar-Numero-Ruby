require_relative 'adivinhar_numero.rb'
require_relative 'rendering.rb'

class Main
    attr_reader :computador

    def initialize
        @computador = AdivinharNumero.new
    end

    def run
        init_game
    end

    private

    def init_game
        loop do
            user_input = Rendering.render_menu

            if user_input == Rendering::INPUT_OPTION::PLAY
                computador.jogar_novamente
                count = 0
                gameplay(count)
            elsif user_input == Rendering::INPUT_OPTION::GAME_INFO
                puts "Você tem 10 tentativas para conseguir descobrir qual foi o numero sorteado pela computador."
            elsif user_input == Rendering::INPUT_OPTION::EXIT
                system('cls')
                break
            end
        end
    end

    def gameplay(count)
        loop do
            player_input = render_play

            computador.adivinhar(player_input)
            count += 1
            break if game_finalized?(count)
        end
    end

    def render_play
        system(Gem.win_platform? ? 'cls' : 'clear')
        Rendering.animacao(Rendering::INPUT_OPTION::PLAY)
        puts 'Digite um Numero entre 1 a 30:'
        gets.chomp.to_i
    end

    def game_finalized?(count)
        return true if computador.venceu
        game_over?(count)
    end

    def game_over?(count)
        return false if count < 10

        system('cls')
        Rendering.render_game_over
        system('pause')
        true
    end
end



