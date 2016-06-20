class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find { |customer| customer.name == name }
  end

  def purchase(item)
    Transaction.new(self.name, item)
    if item.stock > 0
      print "#{self.name} has purchased #{item.title}."
    else
      raise OutOfStockError, "#{item.title} is out of stock."
    end
  end

  private

  def add_to_customers
    unless (@@customers.any? { |customer| customer.name == @name })
      @@customers << self
    else
      raise DuplicateCustomerError, "#{@name} is a duplicate."
    end
  end

end