class Card
    
    attr_accessor = :suit, :value
    
    def initialize(suit, value)
        @suit = suit
        @value = value
    end
    
    def to_s
        return "#{@value} of #{@suit}"
    end
    
end

class Deck

    attr_accessor :suits, :cards

    def initialize
        @cards = []
        @suits = []
    end

    def add_suit(suit)
        if !@suits.include? suit
            @suits << suit
        end
    end
    
    def add_card(card)
        @cards << card
    end
    
    def build_deck(range)
        @suits.each do |suit|
            range.each do |value|
                self.add_card Card.new(suit,value)
            end
        end
    end
        
    def each(&block)
        @cards.each do |card|
            block.call(card)
        end
    end
    
    def shuffle!
        @cards.shuffle!
    end
    
    def deal(num)
        @cards.pop(num)
    end
end

standard_deck = Deck.new
standard_deck.add_suit("Spades")
standard_deck.add_suit("Hearts")
standard_deck.add_suit("Dimonds")
standard_deck.add_suit("Clubs")

standard_deck.build_deck(1..13)

standard_deck.shuffle!

hand = standard_deck.deal(7)

puts "Dealt:"

hand.each do |card|
    puts card
end

