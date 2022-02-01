class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)
    self.last_transaction = [price, quantity]
    quantity.times { |i| items << title }
  end

  def apply_discount
    return 'There is no discount to apply.' if discount == 0
    self.total -= self.total * self.discount / 100
    "After the discount, the total comes to $#{total}."
  end

  def void_last_transaction
    price, quantity = last_transaction
    self.total -= (price * quantity)
    quantity.times { |i| items.pop }
  end
end
