class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@purchases = []
  @@customer_purchases = []

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

  # Feature 1: create purchase report by customer
  def self.purchase_report(customer)
    @@purchases.select { |purchase| @@customer_purchases << purchase if purchase.customer == customer }
    puts @@customer_purchases.count
  end
end