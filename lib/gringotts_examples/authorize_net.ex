defmodule Gringotts.Examples.AuthorizeNet do

  alias Gringotts.Gateways.AuthorizeNet
  alias Gringotts.CreditCard
  alias Gringotts, as: Billing
  
  @card %CreditCard{
    number: "5424000000000015",
    year: 2020,
    month: 12,
    verification_code: "999"
  }

  @opts [ refId: "123456",
    order: %{invoice_number: "INV-12345",
      description: "Product Description"
      },
    lineitems: %{
      item_id: "1",
      name: "vase",
      description: "Cannes logo",
      quantity: "18",
      unit_price: "45.00",
    },
  ]
  @amount 20.00

  def authorize() do
    case Billing.authorize(AuthorizeNet, @amount, @card, @opts) do
      {:ok, response} -> response
      {:error, response} -> response
    end
  end

  def purchase() do
    case Billing.purchase(AuthorizeNet, @amount, @card, @opts) do
      {:ok, response} -> response
      {:error, response} -> response
    end
  end

  def capture(id) do
    case Billing.capture(AuthorizeNet, @amount, id, @opts) do
      {:ok, response} -> response
      {:error, response} -> response
    end
  end
end
