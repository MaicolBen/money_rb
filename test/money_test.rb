require 'test/unit'
require './lib/money_rb/money'

class MoneyTest < Test::Unit::TestCase
  def test_currency
    conversion_rates

    fifty_eur = MoneyRb::Money.new(50, 'EUR')
    assert_equal(fifty_eur.amount, 50)
    assert_equal(fifty_eur.currency, 'EUR')
    assert_equal(fifty_eur.inspect, '50.00 EUR')

    assert_equal(fifty_eur.convert_to('USD'), MoneyRb::Money.new(55.5, 'USD'))
    assert_equal(fifty_eur.convert_to('USD').inspect, '55.50 USD')
    assert_equal(fifty_eur.convert_to('Bitcoin').inspect, '0.24 Bitcoin')

    ten_dollars = MoneyRb::Money.new(10, 'USD')
    assert_equal(ten_dollars.convert_to('EUR').inspect, '9.01 EUR')
  end

  def test_arithmetics
    conversion_rates

    fifty_eur = MoneyRb::Money.new(50, 'EUR')
    twenty_dollars = MoneyRb::Money.new(20, 'USD')
    assert_equal((fifty_eur + twenty_dollars).inspect, '68.02 EUR')
    assert_equal(twenty_dollars + fifty_eur, fifty_eur + twenty_dollars)
    assert_equal((fifty_eur - twenty_dollars).inspect, '31.98 EUR')
    assert_equal((fifty_eur / 2).inspect, '25.00 EUR')
    assert_equal((twenty_dollars * 3).inspect, '60.00 USD')
  end

  def test_comparisons
    conversion_rates
    fifty_eur = MoneyRb::Money.new(50, 'EUR')
    twenty_dollars = MoneyRb::Money.new(20, 'USD')

    assert_equal(twenty_dollars == MoneyRb::Money.new(20, 'USD'), true)
    assert_equal(twenty_dollars == MoneyRb::Money.new(30, 'USD'), false)

    fifty_eur_in_usd = fifty_eur.convert_to('USD')
    assert_equal(fifty_eur_in_usd == fifty_eur, true)

    assert_equal(twenty_dollars > MoneyRb::Money.new(5, 'USD'), true)
    assert_equal(twenty_dollars < fifty_eur, true)
  end

  private

  def conversion_rates
    MoneyRb::Money.conversion_rates('EUR', {
      'USD'     => 1.11,
      'Bitcoin' => 0.0047
    })
  end
end
