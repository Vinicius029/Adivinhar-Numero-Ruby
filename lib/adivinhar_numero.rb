require_relative 'inicializar.rb'
require_relative 'sorteio.rb'

class AdivinharNumero
    attr_accessor :numero 
    attr_accessor :venceu

    def initialize
        system('cls')
        Inicializar.animacao(2)
        sleep(3)
        @numero = Sortear.sorteio
        @venceu = false
    end

    def adivinhar(jogador)
        if @numero == jogador
            puts "Você acertou o numero sorteado foi #{@numero}"
            @venceu = true
            sleep(3)  
            
        elsif @numero < jogador
            puts "O numero #{jogador} é Maior que o numero sorteado!"
            sleep(3) 
        elsif @numero > jogador
            puts "O numero #{jogador} é Menor que o numero sorteado!"
            sleep(3) 
        end     
    end  

    #função caso o jogador queira jogar novamente
    def jogarNovamente
        @numero = Sortear.sorteio
        @venceu = false
    end
end