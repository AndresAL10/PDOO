#encoding: utf-8
  
require 'singleton'
require_relative 'monster'
require_relative 'treasure'
require_relative "cultist"

module NapakalakiGame
  
  class CardDealer
    
    include Singleton
    
    private
    def initialize
      @unusedMonsters = Array.new
      @usedMonsters = Array.new
      @unusedTreasures = Array.new
      @usedTreasures = Array.new
      @unusedCultists = Array.new
      initCards
    end
    
    def initTreasureCardDeck
   
      @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigación", 3, TreasureKind::SHOES)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-comicón", 1, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-gnomicón", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necro-playboycón", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Tentáculo de pega", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
      
    end
    
    def initMonsterCardDeck
        #Monstruo1
       prize = Prize.new(2,1)
       badConsequence = 
       SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta",
       0,[TreasureKind::ARMOR], [TreasureKind::ARMOR])
       @unusedMonsters << Monster.new("Byakhees de bonanza", 8, prize, badConsequence)

       #Monstruo2
       prize = Prize.new(1,1)
       badConsequence = 
       SpecificBadConsequence.new("Embotados con el lindo primigenio te descartas de tu casco visible",
       0,[TreasureKind::HELMET], Array.new)
       @unusedMonsters << Monster.new("Tenochtitlan", 2, prize, badConsequence)

       #Monstruo3
       prize = Prize.new(1,1)
       badConsequence = 
       SpecificBadConsequence.new("El primordial bostezo contagioso. Pierdes el calzado visible",
       0,[TreasureKind::SHOES], Array.new)
       @unusedMonsters << Monster.new("El sopor de Dunwich", 2, prize, badConsequence)

       #Monstruo4
       prize = Prize.new(4,1)
       badConsequence = 
       SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
       0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
       @unusedMonsters << Monster.new("Demonios de Magaluf", 2, prize, badConsequence)

       #Monstruo5
       prize = Prize.new(3,1)
       badConsequence = 
       NumericBadConsequence.new("Pierdes todos tus tesoros visibles",
       0, BadConsequence::MAXTREASURES, 0)
       @unusedMonsters << Monster.new("El gorrón en el umbral", 13, prize, badConsequence)

       #Monstruo6
       prize = Prize.new(2,1)
       badConsequence = 
       SpecificBadConsequence.new("Pierdes la armadura visible",
       0,[TreasureKind::ARMOR], Array.new)
       @unusedMonsters << Monster.new("H.P. Munchcraft", 6, prize, badConsequence)

       #Monstruo7
       prize = Prize.new(1,1)
       badConsequence = 
       SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible",
       0,[TreasureKind::ARMOR], Array.new)
       @unusedMonsters << Monster.new("Necrófago", 13, prize, badConsequence)

       #Monstruo8
       prize = Prize.new(3,2)
       badConsequence = 
       NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles",
       5, 3, 0)
       @unusedMonsters << Monster.new("El rey de rosado", 13, prize, badConsequence)

       #Monstruo9
       prize = Prize.new(1,1)
       badConsequence = 
       NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles",
       2,0,0)
       @unusedMonsters << Monster.new("Flecher", 2, prize, badConsequence)

       #Monstruo10
       prize = Prize.new(2,1)
       badConsequence = 
       DeathBadConsequence.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto")
       @unusedMonsters << Monster.new("Los hondos", 8, prize, badConsequence)

       #Monstruo11
       prize = Prize.new(2,1)
       badConsequence = 
       NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos",
       2,0,2)
       @unusedMonsters << Monster.new("Semillas Cthulhu", 4, prize, badConsequence)

       #Monstruo12
       prize = Prize.new(2,1)
       badConsequence = 
       SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible",
       0,[TreasureKind::ONEHAND],Array.new)
       @unusedMonsters << Monster.new("Dameargo", 1, prize, badConsequence)

       #Monstruo13
       prize = Prize.new(2,1)
       badConsequence = 
       NumericBadConsequence.new("Da mucho asquito. Pierdes 3 niveles",3,0,0)
       @unusedMonsters << Monster.new("Pollipólipo volante", 3, prize, badConsequence)

       #Monstruo14
       prize = Prize.new(3,1)
       badConsequence = 
       DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estás muerto")
       @unusedMonsters << Monster.new("YskhtihyssgGoth", 14, prize, badConsequence)

       #Monstruo15
       prize = Prize.new(3,1)
       badConsequence = 
       DeathBadConsequence.new("La familia te atrapa. Estás muerto")
       @unusedMonsters << Monster.new("Familia feliz", 1, prize, badConsequence)

       #Monstruo16
       prize = Prize.new(2,1)
       badConsequence = 
       SpecificBadConsequence.new("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible",
       2,[TreasureKind::BOTHHANDS],Array.new)
       @unusedMonsters << Monster.new("Roboggoth", 8, prize, badConsequence)

       #Monstruo17
       prize = Prize.new(1,1)
       badConsequence = 
       SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible",
       0,[TreasureKind::HELMET],Array.new)
       @unusedMonsters << Monster.new("El espía sordo", 5, prize, badConsequence)

       #Monstruo18
       prize = Prize.new(2,1)
       badConsequence = 
       NumericBadConsequence.new("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles",
       2,5,0)
       @unusedMonsters << Monster.new("Tongue", 19, prize, badConsequence)

       #Monstruo19
       prize = Prize.new(2,1)
       badConsequence = 
       SpecificBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos",
       3,[TreasureKind::BOTHHANDS,TreasureKind::ONEHAND,TreasureKind::ONEHAND],Array.new)
       @unusedMonsters << Monster.new("Bicéfalo", 21, prize, badConsequence)

       #Monstruo20
       prize = Prize.new(3,1)
       badConsequence = 
       SpecificBadConsequence.new("Pierdes 1 mano visible",
       0,[TreasureKind::ONEHAND],Array.new)
       @unusedMonsters << Monster.new("El mal indecible impronunciable", 10,prize, badConsequence,-2)

       #Monstruo21
       prize = Prize.new(2,1)
       badConsequence = 
       NumericBadConsequence.new("Pierdes tus tesoros visible.Jajaja",
       0,BadConsequence::MAXTREASURES,0)
       @unusedMonsters << Monster.new("Testigos oculares", 6, prize, badConsequence,2)

       #Monstruo22
       prize = Prize.new(2,5)
       badConsequence = 
       DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres")
       @unusedMonsters << Monster.new("El gran cthulhu", 20, prize, badConsequence,4)

       #Monstruo23
       prize = Prize.new(2,1)
       badConsequence = 
       NumericBadConsequence.new("Tu gobierno te recorta 2 niveles",
       2,0,0)
       @unusedMonsters << Monster.new("Serpiente Politico", 8, prize, badConsequence,-2)

       #Monstruo24
       prize = Prize.new(1,1)
       badConsequence = 
       SpecificBadConsequence.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas",
       0,[TreasureKind::ARMOR,TreasureKind::HELMET],[TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS])
       @unusedMonsters << Monster.new("Felpuggoth", 2,prize, badConsequence,5)

       #Monstruo25
       prize = Prize.new(4,2)
       badConsequence = 
       NumericBadConsequence.new("Pierdes 2 niveles",2,0,0)
       @unusedMonsters << Monster.new("Shoggoth", 16, prize, badConsequence,-4)

       #Monstruo25
       prize = Prize.new(1,1)
       badConsequence = 
       NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles",2,0,0)
       @unusedMonsters << Monster.new("Lolitagooth", 2, prize, badConsequence,3)

    end
    
    def initCultistsCardDeck
      @unusedCultists  << Cultist.new("Sectario",1)
      @unusedCultists  << Cultist.new("Sectario",2)
      @unusedCultists  << Cultist.new("Sectario",1)
      @unusedCultists  << Cultist.new("Sectario",2)
      @unusedCultists  << Cultist.new("Sectario",1)
      @unusedCultists  << Cultist.new("Sectario",1)
    end
    
    def shuffleTreasures
      @unusedTreasures.shuffle!
    end
    
    def shuffleMonsters
      @unusedMonsters.shuffle!
    end
    
    def shuffleCultists
      @unusedCultists.shuffle!
    end
    
    public 
    
    def nextTreasure
      if(@unusedTreasures.empty?)
        for usedT in @usedTreasures
          @unusedTreasures << usedT
          @usedTreassures.delete(usedT)
        end
        shuffleTreasures
      end
      treasure = @unusedTreasures.pop
      @usedTreasures <<  treasure
      @unusedTreasures.delete(treasure)
      return treasure
    end
    
    def nextMonster
      if(@unusedMonsters.empty?)
        for usedM in @usedMonsters
          @unusedMonsters << usedM
          @usedMonsters.delete(usedM)
        end
        shuffleMonsters
      end
      monster = @unusedMonsters.pop
      @usedMonsters <<  monster
      @unusedMonsters.delete(monster)
      return monster
    end
    
    def nextCultist
      cultist = @unusedCultists.at(0)
      @unusedCultists.delete_at(0)   
      return cultist
    end
    
    def giveTreasureBack(t)
      @usedTreasures << t
      @unusedTreasures.delete(t)
    end
    
    def giveMonsterBack(m)
      @usedMonsters << m
      @unusedMonsters.delete(m)
    end
    
    
    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
      initCultistsCardDeck
      shuffleTreasures
      shuffleMonsters
      shuffleCultists
    end
    
  end
  
end
