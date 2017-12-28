defmodule Gringotts.Examples.WireCard do
  alias Gringotts, as: Billing
  alias Billing.{CreditCard, Address, Worker, Gateways}
  alias Gringotts.Gateways.WireCard

  @card %CreditCard{
    number: "4200000000000000",
    month: 12,
    year: 2018,
    first_name: "Longbob",
    last_name: "Longsen",
    verification_code: "123",
    brand: "visa"
  }

  @declined_card %CreditCard{
    number: "4000300011112220",
    month: 12,
    year: 2018,
    first_name: "Longbob",
    last_name: "Longsen",
    verification_code: "123",
    brand: "visa"
  }

  @address %{
    name:     "Jim Smith",
    address1: "456 My Street",
    address2: "Apt 1",
    company:  "Widgets Inc",
    city:     "Ottawa",
    state:    "ON",
    zip:      "K1C2N6",
    country:  "CA",
    phone:    "(555)555-5555",
    fax:      "(555)555-6666"
  }

  @options [
    order_id: 1,
    billing_address: @address,
    description: 'Wirecard remote test purchase',
    email: "soleone@example.com",
    ip: "127.0.0.1"
  ] 

  # Testing main payments from iex console
  # $ iex -S mix
  # iex(1)> alias Gringotts.Examples.WireCard
  # iex(2)> WireCard.authorize()
  # Payment authorized ch_1BUaPLJMi9FIIlURigvYZDAi
  # :ok
  def authorize() do
    Billing.authorize(WireCard, 100, @card, @options)    
  end

  def capture() do
    auth_code = authorize() |> parse_and_get_auth_code
    Billing.capture(WireCard, auth_code, 100, @options)
  end

  def purchase() do
    Billing.purchase(WireCard, 100, @card, @options)
  end

  def purchase_using_auth_code() do
    auth_code = authorize() |> parse_and_get_auth_code
    Billing.purchase(WireCard, 100, auth_code, @options)
  end

  def void() do
    auth_code = authorize() |> parse_and_get_auth_code
    Billing.void(WireCard, auth_code, @options)
  end

  def refund() do
    auth_code = purchase() |> parse_and_get_guid_for_refund
    Billing.refund(WireCard, 100, auth_code, @options)
  end

  def store() do
    Billing.store(WireCard, @card, @options)
  end

  # ================ Temp Private Methods for parsing unparsed response =======

  defp parse_and_get_auth_code({:ok, response}) do
    response["WIRECARD_BXML"]["W_RESPONSE"]["W_JOB"]["FNC_CC_PREAUTHORIZATION"]["CC_TRANSACTION"]["PROCESSING_STATUS"]["GuWID"]
  end

  defp parse_and_get_guid_for_refund({:ok, response}) do
    response["WIRECARD_BXML"]["W_RESPONSE"]["W_JOB"]["FNC_CC_PURCHASE"]["CC_TRANSACTION"]["PROCESSING_STATUS"]["GuWID"]
  end
end
