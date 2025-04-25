#basado en Blackjack Master: https://www.minijuegos.com/juego/blackjack-master
load 'jugadores.rb'
system "cls"



def blackjack
    dealer=Jugador.new
    juan=Jugador.new
    a=''
    while a!=0 #se hace un bucle infinito del juego. Se precisa Ctrl + C para salir
        system "cls"
        print":::::::::::::::::::::::::::::::::::::\n\t♠21 Blackjack on Ruby♠\n:::::::::::::::::::::::::::::::::::::\n"
        print"\n\t\b\bPresiona 'n' para empezar: "
        downtime=gets.chomp.to_s
        if downtime=='n'
            print"\n\t\b\b'Don´t deal with the devil'\n"
            sleep(1.2)
            dealer.iniciocrupier #llama a la primera generacion de la carta
            juan.inicio #llama al jugador
            puntajefinal=juan.sumadeljugador.to_i#se recibe el puntaje final del jugador para compararlo con el del crupier
            dealer.finalcrupier(puntajefinal)#se pasa el puntaje final al crupier/dealer
            sleep(2.0)
            print"\n:::::::::::::::::::::::::::::::::::::::::\n♠Escribe cualquier tecla para repetir♠\n:::::::::::::::::::::::::::::::::::::::::\n--->"
            repeat=gets.chomp.to_s
        end
    end
end
blackjack#!!!