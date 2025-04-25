load 'cartas.rb'
class Jugador
    attr_accessor :sumadeldealer, :sumadeljugador
    def initialize
        @sumadeldealer=0
        @sumadeljugador=0
    end
    def inicio
        print "\nJUGADOR\n"
        blackjack=Carta.new
        blackjack.generarcarta(1)
        print "Suma del jugador: #{blackjack.suma}"
        decision=''
        while decision!=2
            i=i.to_i+1.to_i
            print"\n\n#{i}).Pedir otra carta:\n\tSi=[1].\n\tNo/PLANTARTE=[2].\n--->" #se pregunta la elección de si continuar tomando cartas o dar paso al dealer
            decision=gets.chomp.to_i
            print"\n"
            if decision==1 # genera una carta y se suma a la anterior
                print "\nJUGADOR\n"
                sleep (1.0)
                blackjack.generarcarta(0)
                sleep (1.0)
            elsif decision==2 #da paso al dealer
                #no hace nada
            end    
            if blackjack.suma>21 #define perdedor
                decision=2
                sleep (1.0)
                print"Jugador ha perdido\n"
            elsif blackjack.suma==21#define ganador
                decision=2
                sleep (1.0)
                print"Jugador ha ganado\n"
            end
            print "Suma del jugador: #{blackjack.suma}\n" #suma actual
        end
        sleep(1.0)
        puts "\n=========================="
        print "Suma final del jugador: #{blackjack.suma}\n" #suma final del jugador
        puts "==========================\n"
        @sumadeljugador=blackjack.suma
    end
    
    def iniciocrupier# se inicia la primera carta del dealer y se suma a un atributo de la clase Jugador
        print"\nDEALER\n"
        blackjack1=Carta.new
        blackjack1.generarcarta(0)
        @sumadeldealer=blackjack1.suma
        print"Suma del Dealer: #{@sumadeldealer}\n\n" 
    end
    def finalcrupier(puntajefinal)
        if puntajefinal.to_i<21
            sleep(1.0)
            puts "\n------------------"
            print"DEALER Final Deal\n" #se inicia el proceso de fin con el dealer agarrando cartas 
            puts "------------------\n"
            while @sumadeldealer<17 #si el dealer tiene una suma menor a 17, esta condenado a seguir agarrando cartas
                sleep (1.0)
                blackjack2=Carta.new
                blackjack2.generarcarta(0)
                @sumadeldealer=@sumadeldealer+blackjack2.suma##
            end
            sleep(1.0)
            puts "\n=========================="
            print "Suma final del dealer: #{@sumadeldealer}\n"
            puts "==========================\n"
            if @sumadeldealer>21 #si la suma es mayor a 21, el dealer pierde
                print"\nGanó el jugador 1"
            elsif @sumadeldealer>puntajefinal.to_i #si la suma del dealer es mayor que la del jugador pero menor o igual a 21, gana el dealer
                print"\nGanó el dealer."
            elsif @sumadeldealer<puntajefinal.to_i #si el dealer no alcanza el puntaje del jugador, pierde por minoria
                print"Perdió el dealer y ha ganado el jugador" 
            elsif @sumadeldealer==puntajefinal
                print "EMPATE"
            end
        elsif puntajefinal.to_i>21
            print"\nGanó el Dealer" #si el jugador se pasa de 21, gana el dealer
        elsif puntajefinal.to_i==21
            print"\nPerdió el Dealer" #si el jugador obtiene 21, gana directamente        
        end
    end
end


