# defmodule Kuber.Hex.Examples.Stripe do

#   # Alias for using the lib
#   alias Kuber.Hex, as: Billing
#   alias Billing.{CreditCard, Address, Worker, Gateways}
#   alias Kuber.Hex.Gateways.Stripe

#   @card %CreditCard{
#     name: "John Doe",
#     number: "4242424242424242",
#     expiration: {2018, 12},
#     cvc:  "123"
#   }

#   @address %Address{
#     street1: "123 Main",
#     street2: "Suite 100",
#     city: "New York",
#     region: "NY",
#     country: "US",
#     postal_code: "11111"
#   }

#   # Testing main payments from iex console
#   # $ iex -S mix
#   # iex(1)> alias Kuber.Hex.Examples.Stripe
#   # iex(2)> Stripe.authorize()
#   # Payment authorized ch_1BUaPLJMi9FIIlURigvYZDAi
#   # :ok
#   def authorize() do
#     case Billing.purchase(:payment_worker, Stripe, 2000, @card, billing_address: @address, description: "Amazing T-Shirt") do
#         {:ok,    %{authorization: authorization}} ->
#           IO.puts("Payment authorized #{authorization}")
#         {:error, %{code: :declined, reason: reason}} ->
#           IO.puts("Payment declined #{reason}")
#         {:error, error} ->
#           IO.inspect error
#     end
#   end
# end
