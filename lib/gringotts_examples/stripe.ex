defmodule Gringotts.Examples.Stripe do

  alias Gringotts, as: Billing
  alias Billing.{CreditCard, Address, Worker, Gateways}
  alias Gringotts.Gateways.Stripe

  @payment %{
    name: "John Doe",
    number: "4242424242424242",
    expiration: {2018, 12},
    cvc:  "123",
    street1: "123 Main",
    street2: "Suite 100",
    city: "New York",
    region: "NY",
    country: "US",
    postal_code: "11111"
  }

  @options [currency: "usd"]

  def authorize() do
    Billing.authorize(:payment_worker, Stripe, 5, @payment, @options)    
  end

  def purchase() do
    Billing.purchase(:payment_worker, Stripe, 5, @payment, @options)
  end

  def capture() do
    id = "ch_1BYvGkBImdnrXiZwet3aKkQE"
    Billing.capture(:payment_worker, Stripe, id, 5)
  end

  def void() do
    id = "ch_1BYvGkBImdnrXiZwet3aKkQE"
    Billing.void(:payment_worker, Stripe, id)
  end

  def refund() do
    id = "ch_1BYvGkBImdnrXiZwet3aKkQE"
    Billing.refund(:payment_worker, Stripe, 5, id)
  end

  def store() do
    Billing.store(:payment_worker, Stripe, @payment)
  end

end
