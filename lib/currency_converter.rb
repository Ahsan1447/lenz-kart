# frozen_string_literal: true
#

class CurrencyConverter
  attr_reader :price

  USD_EXCHANGE_RATES = { #third api used to update exchange rate at regular interval
    'GBP' => 1.17,
    'EUR' => 1,
    'JOD' => 0.98,
    'JPY' => 0.97
  }

  def initialize(price)
    @price = price
  end

  def to_usd
    "#{price.round(3)} USD"
  end

  def to_gbp
    currency = __callee__.to_s.split('_').last.upcase
    "#{(price * USD_EXCHANGE_RATES[currency]).round(3)} #{currency}"
  end

  alias_method :to_eur, :to_gbp
  alias_method :to_jod, :to_gbp
  alias_method :to_jpy, :to_gbp
end
