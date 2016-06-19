class Transaction

  @@id = 1

  def initialize(customer, product)
    @id = @@id
    @@id += 1
  end

end