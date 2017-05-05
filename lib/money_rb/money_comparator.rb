module MoneyRb
  module MoneyComparator
    def ==(other)
      first_part = to_base
      second_part = other.to_base
      first_part.amount.round(2) == second_part.amount.round(2) &&
        first_part.currency == second_part.currency
    end

    def >(other)
      first_part = to_base
      second_part = other.to_base
      first_part.amount > second_part.amount
    end

    def <(other)
      first_part = to_base
      second_part = other.to_base
      first_part.amount < second_part.amount
    end
  end
end
