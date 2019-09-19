
class CashRegister
    attr_accessor :discount, :total, :items, :last


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @hash ||= {}
    end
    
    def add_item(title, price, quantity = 1)
        if quantity > 1
            price = price * quantity
        end
        @total += price
        quantity.times do
        @items << title
        @last = price
       
        end
    end

    def apply_discount
      if @discount == 0
        "There is no discount to apply."
      else
        discount = 100.0 - @discount 
        @total = @total * discount / 100
        @total
        "After the discount, the total comes to $#{@total.to_i}."
      end
    end

    def void_last_transaction
        @total -= @last
        if @total == 0
            0.0
        else
            @total
        end
    end
    
end