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

  private

  def add_to_customers
    unless (@@customers.any? { |customer| customer.name == @name })
      @@customers << self
    else
      raise DuplicateCustomerError, "#{@name} is a duplicate."
    end
  end

end