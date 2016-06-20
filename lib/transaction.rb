class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@purchases = []

  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    @@purchases << self
    @product.reduce_stock
  end

  def self.all
    @@purchases
  end

  def self.find(int)
    @@purchases[int-1]
  end
end