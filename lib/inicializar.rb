class Inicializar
    attr_accessor :cursor

    def self.menu
        loop do
            system('cls')
            animacao(1)
            puts 'Selecione uma das opções:'
            puts '1 - Jogar'    
            puts '2 - Informação do jogo'    
            puts '3 - Sair' 
            opc = gets.chomp.to_i
            if opc == 1
                return 1
            elsif opc == 2
                return 2
            elsif opc == 3
                return 3
            end 
        end  
    end

    def self.animacao(opc=0)
        # cabeçalho do menu
        if opc == 1
            File.open(File.expand_path('../../lib/desenhos/adivinhar.txt', __FILE__),'r')  do
                |arq|
                while line = arq.gets
                    puts line
                    sleep(1)
                end
            end
        elsif opc = 2
            # animação de carregamento
            File.open(File.expand_path('../../lib/desenhos/carregando.txt', __FILE__),'r')  do
                |arq|
                while line = arq.gets
                    puts line
                    sleep(1)
                end
            end
        end
    end
end