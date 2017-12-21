defmodule Gringotts.Examples.Trexle do

  alias Gringotts, as: Billing
  alias Billing.{CreditCard, Address, Worker, Gateways}
  alias Gringotts.Gateways.Trexle

  @payment %{
    name: "John Doe",
    number: "5200828282828210",
    expiry_month: 1,
    expiry_year: 2018,
    cvc:  "123",
    address_line1: "456 My Street",
    address_city: "Ottawa",
    address_postcode: "K1C2N6",
    address_state: "ON",
    address_country: "CA"
  }

  @options [currency: "usd"]

  def authorize() do
    Billing.authorize(:payment_worker, Trexle, 50, @payment, @options)    
  end

  def purchase() do
    Billing.purchase(:payment_worker, Trexle, 50, @payment, @options)
  end

  def capture() do
  end

  def void() do
  end

  def refund() do
  end

  def store() do
  end

end