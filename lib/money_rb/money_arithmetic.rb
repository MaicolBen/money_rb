module MoneyRb
  module MoneyArithmetic
    def +(other)
      sum = to_base.amount + other.to_base.amount
      self.class.new sum, base
    end

    def -(other)
      subtraction = to_base.amount - other.to_base.amount
      self.class.new subtraction, base
    end

    def /(other)
      self.class.new (amount / other), currency
    end

    def *(other)
      self.class.new (amount * other), currency
    end
  end
end
