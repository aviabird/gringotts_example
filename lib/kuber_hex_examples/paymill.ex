defmodule Kuber.Hex.Examples.Paymill do

  alias Kuber.Hex, as: Billing
  alias Kuber.Hex.Gateways.Paymill
  alias Kuber.Hex.CreditCard

  @credit_card %CreditCard{
    first_name: "Sagar",
    last_name: "Karwande",
    number: "4111111111111111",
    month: 12,
    year: 2018,
    verification_code: 123
  }

  @options [
    currency: "EUR",
    amount: 120
  ]

  def authorize() do
    Billing.authorize(:payment_worker, Paymill, 120, @credit_card, @options)
  end
end
