class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find { |product| product.title == title }
  end

  def self.in_stock
    product_in_stock = @@products.select { |product| product.stock > 0 }
    puts product_in_stock.to_s
  end

  def in_stock?
    @stock > 0
  end

  # def include?(name)
  #   name.stock > 0
  # end

  private

  def add_to_products
    unless @@products.any? { |product| product.title == @title }
      @@products << self
    else
      raise DuplicateProductError, "#{@title} is a duplicate."
    end
  end

end