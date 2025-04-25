class Carta
    attr_accessor :type, :suma
    def initialize
        @type=['A',2,3,4,5,6,7,8,9,10,'J','Q','K']
        @suma=0
    end



    def generarcarta(x)
        for i in(0..x)# x recibe un valor dependiendo de si es Dealer o jugador normal para la cantidad de cartas generadas al inicio:: se genera una carta
            a=rand(13)
            if @type[a].to_i==2 || @type[a].to_i==6 || @type[a].to_s=='K'
                print"#{@type[a]}⧫\n"
            elsif @type[a].to_i==4 || @type[a].to_i==8 || @type[a].to_s=='J'
                print"#{@type[a]}♥\n"
            elsif @type[a].to_s=='A' || @type[a].to_i==5 || @type[a].to_i==9 || @type[a].to_i==10
                print"#{@type[a]}♠\n"
            elsif @type[a].to_i==3 || @type[a].to_i==7 || @type[a].to_s=='Q'
                print"#{@type[a]}♣\n"
            end

            #se transforman los valores simbolicos a numéricos para hacer la cuantificaciónd de las sumas mas adelante
            if @type[a].to_s=='A'
                @type[a]=1.to_i
            elsif @type[a].to_s=='K' || @type[a].to_s=='J' || @type[a].to_s=='Q'
               @type[a]=10.to_i
            end
            @suma=@suma.to_i+@type[a].to_i 
        end
    end
end

