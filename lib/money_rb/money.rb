require_relative './money_comparator'
require_relative './money_arithmetic'

module MoneyRb
  class Money
    include MoneyComparator
    include MoneyArithmetic

    attr_reader :amount, :currency

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    def self.conversion_rates(base, conversions)
      @@base = base
      @@conversions = conversions
    end

    def convert_to(currency)
      self.class.new convert_amount(currency), currency
    end

    def inspect
      "#{format('%.2f', amount)} #{currency}"
    end

    def base?
      currency == base
    end

    def to_base
      base? ? self : convert_to(base)
    end

    private

    def convert_amount(currency)
      if currency == base
        amount / conversions[self.currency]
      else
        conversions[currency] * amount
      end
    end

    def base
      @@base
    end

    def conversions
      @@conversions
    end
  end
end
