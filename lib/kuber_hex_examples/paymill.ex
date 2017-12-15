defmodule Kuber.Hex.Examples.Paymill do

  alias Kuber.Hex, as: Billing
  alias Kuber.Hex.Gateways.Paymill
  alias Kuber.Hex.CreditCard

  @credit_card %CreditCard{
    name: "Sagar Karwande",
    number: "4111111111111111",
    expiration: {12, 2018},
    cvc: 123
  }

  @options [
    currency: "EUR",
    amount: 120
  ]

  def authorize() do
    Billing.authorize(:payment_worker, Paymill, 120, @credit_card, @options)
  end
end
