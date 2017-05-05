# Setup

    gem build money_rb.gemspec
    gem install ./money_rb-0.0.1.gem

# Usage

    require 'money_rb/money'

### Configure the currency rates with respect to a base currency:

    MoneyRb::Money.conversion_rates('EUR', {
      'USD' => 1.11,
      'UYU' => 30.7
    })

### Instantiate:

    fifty_eur = MoneyRb::Money.new(50, 'EUR')
    fifty_eur.amount   # => 50
    fifty_eur.currency # => "EUR"
    fifty_eur.inspect  # => "50.00 EUR"

### Convert to a different currency:

    fifty_eur.convert_to('USD') # => 55.50 USD

### Arithmetics:

    twenty_dollars = MoneyRb::Money.new(20, 'USD')
    fifty_eur + twenty_dollars # => 68.02 EUR
    fifty_eur - twenty_dollars # => 31.98 EUR
    fifty_eur / 2              # => 25.00 EUR
    twenty_dollars * 3         # => 60.00 USD

### Comparisons:

    twenty_dollars == MoneyRb::Money.new(20, 'USD') # => true
    twenty_dollars == MoneyRb::Money.new(30, 'USD') # => false

    fifty_eur_in_usd = fifty_eur.convert_to('USD')
    fifty_eur_in_usd == fifty_eur          # => true

    twenty_dollars > MoneyRb::Money.new(5, 'USD')   # => true
    twenty_dollars < fifty_eur   # => true


# Testing

    rake test
