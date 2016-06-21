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
    add_to_transactions
    @product.reduce_stock
  end

  def self.all
    @@purchases
  end

  def self.find(int)
    @@purchases.find { |purchase| purchase.id == int }
  end

  private

  def add_to_transactions
    if @product.stock > 0
      @@purchases << self
    else
      raise OutOfStockError, "#{@product.title} is out of stock."
    end
  end

  # Feature 1: create purchase report by customer
  def self.purchase_report(customer)
    @@purchases.select { |purchase| @@customer_purchases << purchase if purchase.customer == customer }
    puts @@customer_purchases.count
  end
end