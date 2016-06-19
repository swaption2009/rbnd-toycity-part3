class Product
  attr_reader :title

  @@products = []
  @product = {}

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    @product = { title: @title, price: @price, stock: @stock }
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    unless @@products.any? { |product| product[:title] == @title }
      @@products << @product
    else
      raise DuplicateProductError, "#{@product} is a duplicate and can't be added."
    end
  end

end