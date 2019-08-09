class CashRegister
  
  attr_accessor :discount, :total
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = Array.new
  end
  
  
  #@all_prices = Array.new
  
  def add_item(title, price, quantity = 1)
    quantity.times {@items.push(title)}
    @all_prices.push(price)
    return self.total += (price * quantity)
  end
  
  def apply_discount
    if self.discount == 0 
      return "There is no discount to apply."
    else 
      discount = self.discount * 0.01
      this_discount = @total * discount
      self.total = self.total - this_discount
      return "After the discount, the total comes to $#{self.total.round}."
    end
  end
  
  def items
    @items
  end

  def void_last_transaction
    @total - (@all_prices[-1]).to_i
    @all_prices.pop
  end

end

cashregister = CashRegister.new