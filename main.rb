require_relative 'lib/adivinhar_numero.rb'
require_relative 'lib/inicializar.rb'


computador = AdivinharNumero.new

loop do
    r = Inicializar.menu

    if r == 1
        computador.jogarNovamente
        cont = 0
        loop do
            system('cls')
            Inicializar.animacao(1)
            puts 'Digite um Numero entre 1 a 30:'
            jogador = gets.chomp.to_i

            computador.adivinhar(jogador)

            if computador.venceu == true
                break
                
            #condição para fazer contagem de tentativas
            elsif computador.venceu == false
                cont += 1
                if cont > 10
                    system('cls')   
                    File.open(File.expand_path('../lib/desenhos/gamerover.txt', __FILE__),'r')  do
                        |arq|
                        while line = arq.gets
                            puts line
                            sleep(0.75)
                        end
                    end
                    system('pause')
                    break
                end
                
            end
        end
    elsif r == 2
        puts "Você tem 10 tentativas para conseguir descobrir qual foi o numero sorteado pela computador."
    elsif r == 3
        system('cls')
        break
    end
      
end