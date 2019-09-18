class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_item = []
    end
    attr_reader :discount
    attr_accessor :total

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do 
            @items << title
        end
        @last_item = [title, price, quantity]
    end

    def apply_discount
        discount_amt = @total*@discount/100
        @total -= discount_amt
        if @discount == 0 
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        
        #@last_item = [title, price, quantity]
        @last_item[2].times do
            @items.pop
            @total -= @last_item[1]
        end
        # if @items.length == 0
        #     @total = 0
        # end
    end


end

