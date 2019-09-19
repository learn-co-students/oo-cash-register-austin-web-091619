class CashRegister

    attr_accessor :total, :discount, :items, :last_price

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_price = 0
    end

    def add_item (title, price, quantity = 1)
        self.last_price = price * quantity
        self.total += price * quantity
        quantity.times{
            self.items << title
        }
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            rate = (100 - self.discount).to_f / 100

            temp = self.total * rate
            self.total = temp.to_i

            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_price
    end

end