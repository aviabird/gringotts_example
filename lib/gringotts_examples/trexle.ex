defmodule Gringotts.Examples.Trexle do

  alias Gringotts, as: Billing
  alias Billing.{CreditCard, Address, Worker, Gateways}
  alias Gringotts.Gateways.Trexle

  @payment %CreditCard{
    number: "5200828282828210",
    month: 12,
    year: 2018,
    first_name: "John",
    last_name: "Doe",
    verification_code: "123",
    brand: "visa"
  }

  @address %Address{
    street1: "123 Main",
    street2: "Suite 100",
    city: "New York",
    region: "NY",
    country: "US",
    postal_code: "11111",
    phone: "(555)555-5555"
  }

  @options [ email: "john@trexle.com",
             ip_address: "66.249.79.118",
             billing_address: @address,
             description: "Store Purchase 1437598192"]

  def authorize() do
    Billing.authorize(Trexle, 50, @payment, @options)
  end

  def purchase() do
    Billing.purchase(Trexle, 50, @payment, @options)
  end

  def capture(charge_token) do
    Billing.capture(Trexle, charge_token, 50)
  end

  def refund(charge_token) do
    Billing.refund(Trexle, 50, charge_token, @options)
  end

  def store() do
    Billing.store(Trexle, @payment, @options)
  end

end
