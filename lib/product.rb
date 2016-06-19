class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    unless @@products.include?(@title)
      @@products << @title
    else
      raise DuplicateProductError, "#{@title} is a duplicate and can't be added."
    end
  end

end