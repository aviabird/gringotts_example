defmodule Kuber.Hex.Examples.Monei do
  alias Kuber.Hex.{CreditCard, Address, Worker, Gateways}

  @card %CreditCard{
    name: "Jo Doe",
    number: "4200000000000000",
    expiration: {2099, 12},
    cvc:  "123"
  }

  @bad_card %CreditCard{
    name: "Jo Doe",
    number: "4200000000000000",
    expiration: {2011, 12},
    cvc:  "123"
  }

  def authorize() do
    case Kuber.Hex.authorize(:monei_gateway, 20.00, @card, description: "Two Amazing T-Shirts") do
      {:ok, %{id: id}} ->
        IO.puts("'PA' request succeeded with id: '#{id}'")
        id
        
      {:error, %{code: code, reason: reason}} ->
        IO.puts("'PA' request failed (#{code}) '#{reason}'")

      {:error, error} ->
        IO.inspect error
    end
  end

  def capture(referenceId) do
    case Kuber.Hex.capture_amount(:monei_gateway, 10.00, referenceId, description: "Just one T-Shirt") do
      {:ok, %{id: id}} ->
        IO.puts("'CP' request succeeded with id: '#{id}'")
        id
        
      {:error, %{code: code, reason: reason}} ->
        IO.puts("'CP' request failed (#{code}) '#{reason}'")

      {:error, error} ->
        IO.inspect error
    end
  end

  def purchase() do
    case Kuber.Hex.purchase(:monei_gateway, 30.00, @card, description: "A jeans and 2 T-Shirts") do
      {:ok, %{id: id}} ->
        IO.puts("'DB' request succeeded with id: '#{id}'")
        id
        
      {:error, %{code: code, reason: reason}} ->
        IO.puts("'DB' request failed (#{code}) '#{reason}'")

      {:error, error} ->
        IO.inspect error
    end
  end
end

"""
alias Kuber.Hex.Examples.Monei
id = Monei.authorize
"""
