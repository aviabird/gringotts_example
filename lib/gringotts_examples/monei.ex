defmodule Gringotts.Examples.Monei do
  alias Gringotts.{CreditCard, Gateways.Monei}

  @card %CreditCard{
    first_name: "Jo",
    last_name: "Doe",
    number: "4200000000000000",
    year: 2099,
    month: 12,
    verification_code: "123",
    brand: "VISA"
  }

  @amount Money.new(42, :EUR)
  
  def authorize() do
    case Gringotts.authorize(Monei, @amount, @card, description: "Two Amazing T-Shirts") do
      {:ok, %{id: id}} ->
        IO.puts("'PA' request succeeded with id: '#{id}'")
        id
        
      {:error, %{code: code, reason: reason}} ->
        IO.puts("'PA' request failed (#{code}) '#{reason}'")

      {:error, error} ->
        IO.inspect error
    end
  end

  def purchase() do
    case Gringotts.purchase(Monei, @amount, @card, description: "A jeans and 2 T-Shirts") do
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
alias Gringotts.Examples.Monei
id = Monei.authorize
"""
